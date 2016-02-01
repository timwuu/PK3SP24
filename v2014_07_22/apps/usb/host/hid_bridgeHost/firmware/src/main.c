/********************************************************************
 Software License Agreement:

 The software supplied herewith by Microchip Technology Incorporated
 (the "Company") for its PIC(R) Microcontroller is intended and
 supplied to you, the Company's customer, for use solely and
 exclusively on Microchip PIC Microcontroller products. The
 software is owned by the Company and/or its supplier, and is
 protected under applicable copyright laws. All rights are reserved.
 Any use in violation of the foregoing restrictions may subject the
 user to criminal sanctions under applicable laws, as well as to
 civil liability for the breach of the terms and conditions of this
 license.

 THIS SOFTWARE IS PROVIDED IN AN "AS IS" CONDITION. NO WARRANTIES,
 WHETHER EXPRESS, IMPLIED OR STATUTORY, INCLUDING, BUT NOT LIMITED
 TO, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
 PARTICULAR PURPOSE APPLY TO THIS SOFTWARE. THE COMPANY SHALL NOT,
 IN ANY CIRCUMSTANCES, BE LIABLE FOR SPECIAL, INCIDENTAL OR
 CONSEQUENTIAL DAMAGES, FOR ANY REASON WHATSOEVER.
 *******************************************************************/

/** INCLUDES *******************************************************/
#include <xc.h>
#include <stdlib.h>
#include <usb/usb.h>
#include <usb/usb_host_hid.h>

#include <system.h>
#include <app_host_hid_keyboard.h>
#include <uart_buffer.h>

#include "uart.h"

//#define UARTBUF_SIZE 4

//char iBuf[UARTBUF_SIZE];
//char oBuf[UARTBUF_SIZE];
//unsigned int iBufCnt;

void setup();
void loop();
void ConfigurePinReMap();
void U1RXISR();

void transferDataToPICkit();

volatile int isUART_CONNECTED;

/********************************************************************
 * Function:        void main(void)
 *
 * PreCondition:    None
 *
 * Input:           None
 *
 * Output:          None
 *
 * Side Effects:    None
 *
 * Overview:        Main program entry point.
 *
 * Note:            None
 *******************************************************************/
MAIN_RETURN main(void) {
    //------------- test UART ----------------
    setup();

    //--------------------------------
    SYSTEM_Initialize(SYSTEM_STATE_USB_HOST);

   // while (isUART_CONNECTED == 0); //make sure UART is connected before Init USB Stack

    //Initialize the stack
    USBHostInit(0);

    APP_HostHIDKeyboardInitialize();
    
    UB_Init();  // UART_Buffer

    while (1) {
        USBHostTasks();
        USBHostHIDTasks();

        //Application specific tasks
        APP_HostHIDKeyboardTasks();
        
        UB_TxTasks();

        //UART_Flush();
        
        //if (iBufCnt == UARTBUF_SIZE) transferDataToPICkit();

        LATBbits.LATB3 ^= 1;
    }//end while
}//end main

/****************************************************************************
  Function:
    bool USB_ApplicationEventHandler( uint8_t address, USB_EVENT event,
                void *data, uint32_t size )

  Summary:
    This is the application event handler.  It is called when the stack has
    an event that needs to be handled by the application layer rather than
    by the client driver.

  Description:
    This is the application event handler.  It is called when the stack has
    an event that needs to be handled by the application layer rather than
    by the client driver.  If the application is able to handle the event, it
    returns true.  Otherwise, it returns false.

  Precondition:
    None

  Parameters:
    uint8_t address    - Address of device where event occurred
    USB_EVENT event - Identifies the event that occured
    void *data      - Pointer to event-specific data
    uint32_t size      - Size of the event-specific data

  Return Values:
    true    - The event was handled
    false   - The event was not handled

  Remarks:
    The application may also implement an event handling routine if it
    requires knowledge of events.  To do so, it must implement a routine that
    matches this function signature and define the USB_HOST_APP_EVENT_HANDLER
    macro as the name of that function.
 ***************************************************************************/
bool USB_HOST_APP_EVENT_HANDLER(uint8_t address, USB_EVENT event, void *data, uint32_t size) {
    switch ((int) event) {
            /* Standard USB host events ******************************************/
        case EVENT_VBUS_REQUEST_POWER:
        case EVENT_VBUS_RELEASE_POWER:
        case EVENT_HUB_ATTACH:
        case EVENT_UNSUPPORTED_DEVICE:
        case EVENT_CANNOT_ENUMERATE:
        case EVENT_CLIENT_INIT_ERROR:
        case EVENT_OUT_OF_MEMORY:
        case EVENT_UNSPECIFIED_ERROR:
            return true;
            break;

            /* HID Class Specific Events ******************************************/
        case EVENT_HID_RPT_DESC_PARSED:
           
            if (APP_HostHIDKeyboardReportParser() == true) {
                return true;
            }
            break;

        default:
            break;
    }

    return false;

}

void setup() {

    AD1PCFG = 0xFFFF;

    TRISA = 0xFFFF;

    TRISB = 0xFFFF;

    TRISBbits.TRISB1 = 0;
    TRISBbits.TRISB2 = 0;
    TRISBbits.TRISB3 = 0;
    TRISBbits.TRISB15 = 0;
    
    LATBbits.LATB15=0;
    //TRISBbits.TRISB2 = 0;  //timwuu fix BAUD RATE
    //LATBbits.LATB3=1;

    isUART_CONNECTED = 0;

    ConfigurePinReMap();

//    iBufCnt = 0;
}


//void getDouble( double* x) {
//int i=0;
//char buff[80];
//char c;
//
//while(1)
//{
//    while(U1STAbits.URXDA==0); //loop until URXDA is 1
//    if( (c=(char)U1RXREG)==0x0D) break; //CR
//    buff[i++] = c;
//
//}
//buff[i]=0;  //null-terminated string
//
// *x=atof(buff);
// return;
//}

//void loop() {
//
//    char buffer[80];
//    char start_str[]= "\n enter the start value: ";
//    char end_str[]="\n enter the end value: ";
//
//    double f1;
//
//    InitUART();
//
//    LATBbits.LATB2 = 1;
//
//
//    int i = 0;
//
//    while (true) {
//
//            while(U1STAbits.URXDA==0);  //wait for a char
//    buffer[0]= (char)U1RXREG;
//    
//    putsUART1(start_str);
//
//    getDouble(&f1);
//
//    sprintf( buffer, "\n f1:%lf", f1);
//   
//    putsUART1(buffer);
//
//
//        if (i == 0) LATBbits.LATB3 ^= 1;
//        i++;
//    }
//
//}

void __attribute__((interrupt,auto_psv)) _U1RXInterrupt() {

    while(U1STAbits.URXDA) UB_ProcessCommand((unsigned char) U1RXREG );
    //isUART_CONNECTED = 1;
    // if (iBufCnt < UARTBUF_SIZE) iBuf[iBufCnt++] = (char) U1RXREG;
    LATBbits.LATB1 ^= 1;
    _U1RXIF = 0;

}