#include <uart_buffer.h>

#define BUFFER_SIZE 64

#define STX 0x55
#define DLE 0x05
#define ETX 0x04

//terminal testing
//#define STX 'S'
//#define DLE 'D'
//#define ETX 'E'

typedef enum _BUFFER_STATE {
    EMPTY,
    CMD_TX,        
    CMD_TX_DLE,
    TX_COMPLETE,
    NON_EMPTY        
} BUFFER_STATE;

unsigned char cmdBuffer[BUFFER_SIZE];
unsigned char rspBuffer[BUFFER_SIZE];

unsigned int cmdBufferIndex;
unsigned int rspBufferIndex;

unsigned char cmdBufferChecksum;

BUFFER_STATE cmdBufferState;
BUFFER_STATE rspBufferState;

void App_SetReportState(uint8_t io);

void UB_Init(void)
{
    cmdBufferState=EMPTY;  
    cmdBufferIndex=0;
    rspBufferIndex=0;
}

void UB_SetCmdBufferStateEmpty()
{
    cmdBufferState= EMPTY;
}

void UB_ProcessCommand( unsigned char rxByte)
{
    switch(cmdBufferState)
    {
        case EMPTY:
            if(rxByte==STX) cmdBufferState= CMD_TX;            
            break;
        case CMD_TX:
            switch (rxByte) {
                case STX: //Start over if STX
                    cmdBufferIndex=0;
                    cmdBufferChecksum = 0;
                    break;
                case ETX: //End of packet if ETX
                    cmdBufferChecksum = ~cmdBufferChecksum + 1; //test checksum
                    if (cmdBufferChecksum == 0) {
                        cmdBufferState = TX_COMPLETE;
                        // if no data, set to GET_INPUT_REPORT
                        if (cmdBufferIndex == 1) {
                            //App_SetReportState(0x01);
                            cmdBufferState = EMPTY;
                        } else App_SetReportState(0x00); // set to SEND_OUTPUT_REPORT
                        return; //return if OK
                    }
               
                    cmdBufferState = EMPTY; //otherwise restart                       
                    cmdBufferIndex = 0x00;
                    break;

                case DLE: //If DLE, treat next as data
                    cmdBufferState= CMD_TX_DLE;
                    break;
                default: //get data, put in buffer
                    cmdBufferChecksum += rxByte;
                    cmdBuffer[cmdBufferIndex++]= rxByte;
                    break;
            }
            break;
        case CMD_TX_DLE:
            cmdBufferChecksum += rxByte;
            cmdBuffer[cmdBufferIndex++] = rxByte;
            cmdBufferState= CMD_TX;
            break;
        default:
            break;
    }
    
}

void UB_PrepareOutputReport( uint8_t *buffer)
{
    int i;

    //buffer[0]=0x76;  //'v':FIRMWARE_VERSION
    
    if (cmdBufferState == TX_COMPLETE) {
        for (i = 0; i < cmdBufferIndex-1; i++) buffer[i] = cmdBuffer[i];
        for (; i < 64; i++) buffer[i] = 0xAD;  //'Z':End of Buffer
        //for (; i < 64; i++) buffer[i] = 0x5A;  //'Z':NOP
    }
    
    cmdBufferState= EMPTY;    
}

void UB_PrepareResponseBuffer( uint8_t *buffer)
{
    int i;
    for( i=0; i<BUFFER_SIZE; i++) rspBuffer[i]= buffer[i];
    rspBufferIndex = BUFFER_SIZE;
    rspBufferState = NON_EMPTY;
}

void UB_TxTasks(void) {

    //send data if the UTXBF is not full
    if ((rspBufferIndex > 0) && (U1STAbits.UTXBF == 0)) {
        U1TXREG = rspBuffer[BUFFER_SIZE-rspBufferIndex];
        rspBufferIndex--;
        //Nop();
        //Nop();
    }

    if (rspBufferIndex == 0) rspBufferState = EMPTY;
}