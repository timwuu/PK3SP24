#include <uart_buffer.h>
#include "app_device_custom_hid.h"

#define bool unsigned int
#define true 1
#define false 0

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
    NON_EMPTY,
    RX_COMPLETE,
    TX_READY
} BUFFER_STATE;

unsigned char cmdBuffer[5+BUFFER_SIZE*2];
unsigned char rspBuffer[BUFFER_SIZE];

unsigned int cmdBufferIndex;
unsigned int rspBufferIndex;

unsigned int cmdSize;

unsigned char cmdBufferChecksum;

BUFFER_STATE cmdBufferState;
BUFFER_STATE rspBufferState;

void App_SetReportState(uint8_t io);

void UB_Init(void)
{
    cmdBufferState=EMPTY;  
    cmdBufferIndex=0;
    cmdSize=0;
    rspBufferState=EMPTY;  
    rspBufferIndex=0;
    
    T2CON=0;
    T2CONbits.TCKPS=0x03;
    PR2=0x270;// 0xF423;
}

unsigned int UB_IsRxComplete()
{
    return (rspBufferState == RX_COMPLETE);
}

void UB_ProcessResponse( uint8_t rxByte) {

    if( rspBufferIndex == BUFFER_SIZE ) return;
    rspBufferState=NON_EMPTY;
    rspBuffer[rspBufferIndex++] = rxByte;
    if (rspBufferIndex == BUFFER_SIZE) rspBufferState = RX_COMPLETE;
}

void UB_PrepareCommand( uint8_t *buffer)
{
    int i, j;
    unsigned char checkSum, cksum;

    i= 0;
    j= 0;
    checkSum= 0;

    // two start signal <STX>
    cmdBuffer[j++] = STX;
    cmdBuffer[j++] = STX;

    for (i = 0; i < BUFFER_SIZE; i++, j++) {
        switch (buffer[i]) {
            case STX:
            case ETX:
            case DLE:
                cmdBuffer[j++] = DLE;
                break;

            default:
                break;

        }

        checkSum += buffer[i];
        cmdBuffer[j] = buffer[i];
    }

    //<checksum><ETX>
    cksum = (unsigned char) ((~checkSum + 1) & 0xFF);

    switch (cksum) {
        case STX:
        case ETX:
        case DLE:
            cmdBuffer[j++] = DLE;
            break;

        default:
            break;
    }

    cmdBuffer[j++] = cksum;
    cmdBuffer[j++] = ETX;

    cmdSize=j;
    cmdBufferIndex=j;
    cmdBufferState = TX_READY;
    return;
    
}

void UB_PrepareResponseBuffer( uint8_t *buffer)
{
    int i;
    for( i=0; i<BUFFER_SIZE; i++) buffer[i]=rspBuffer[i];
    rspBufferIndex = 0;
    rspBufferState = EMPTY;
}

void UB_TxTasks(void) {

    unsigned char cnf;
    unsigned int i;
    
    if(cmdBufferState != TX_READY) return;
    
    TMR2 = 0;  //reset counter
    //IFS0bits.T2IF = 0;
   
    //send data if the UTXBF is not full
    for (i = 0; i < 4; i++) {
        if ((cmdBufferIndex > 0) && (U1STAbits.UTXBF == 0)) {
            U1TXREG = cmdBuffer[cmdSize - cmdBufferIndex];
            cmdBufferIndex--;
        }
    }

    if (cmdBufferIndex == 0) {
        cmdBufferState = EMPTY;

        //wait for confirmation
        IEC0bits.U1RXIE=0;
        while(IFS0bits.U1RXIF==0);  //wait
        cnf=U1RXREG;
        IFS0bits.U1RXIF=0;
        IEC0bits.U1RXIE=1;
        
        //restart timer
//        TMR2 = 0;
//        IFS0bits.T2IF = 0;
//        T2CONbits.TON = 0;

        APP_SetReadyToReceiveCmd();

    }
}

void UB_GetResponse(void) {
    
    if((T2CONbits.TON==0) || ( IFS0bits.T2IF==0)) return;
    
    T2CONbits.TON=0;  //stop the timer

    if (U1STAbits.UTXBF == 0) U1TXREG = STX;
    if (U1STAbits.UTXBF == 0) U1TXREG = STX;
    if (U1STAbits.UTXBF == 0) U1TXREG = 0;
    if (U1STAbits.UTXBF == 0) U1TXREG = ETX;
    
}
