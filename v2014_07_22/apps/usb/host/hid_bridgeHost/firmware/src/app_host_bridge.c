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
#include <usb/usb.h>
#include <usb/usb_host_hid.h>

#include <stdint.h>
#include <stdbool.h>
#include <system.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include <timer_1ms.h>
#include <uart_buffer.h>
#include <uart.h>

// *****************************************************************************
// *****************************************************************************
// Type definitions
// *****************************************************************************
// *****************************************************************************

typedef enum _APP_STATE {
    DEVICE_NOT_CONNECTED,
    WAITING_FOR_DEVICE,
    DEVICE_CONNECTED, /* Device Enumerated  - Report Descriptor Parsed */
    GET_INPUT_REPORT, /* perform operation on received report */
    INPUT_REPORT_PENDING,
    SEND_OUTPUT_REPORT, /* Not needed in case of mouse */
    OUTPUT_REPORT_PENDING,
    ERROR_REPORTED
} PICKIT_STATE;

typedef struct {
    PICKIT_STATE state;
    bool goSEND_OUTPUT_REPORT;  //timijk 2016.01.11    
    bool inUse;

    uint16_t size;
    uint8_t *buffer;

    HID_DATA_DETAILS details;

} PICKIT;

#define MAX_ERROR_COUNTER               (10)

// *****************************************************************************
// *****************************************************************************
// Local Variables
// *****************************************************************************
// *****************************************************************************

static PICKIT pickit;

extern unsigned char cmdBuffer[];
extern unsigned char rspBuffer[];

// *****************************************************************************
// *****************************************************************************
// Local Function Prototypes
// *****************************************************************************
// *****************************************************************************
static void App_ProcessInputReport(void);

static void App_PrepareOutputReport(void);

// *****************************************************************************
// *****************************************************************************
// Functions
// *****************************************************************************
// *****************************************************************************

/*********************************************************************
 * Function: void APP_HostHIDTimerHandler(void);
 *
 * Overview: Switches over the state machine state to get a new report
 *           periodically if the device is idle
 *
 * PreCondition: None
 *
 * Input: None
 *
 * Output: None
 *
 ********************************************************************/
static void APP_HostHIDTimerHandler(void) {
    if (pickit.state == DEVICE_CONNECTED) {
        if (pickit.goSEND_OUTPUT_REPORT) {
            pickit.state = SEND_OUTPUT_REPORT;
            pickit.goSEND_OUTPUT_REPORT = false;
        } else pickit.state = GET_INPUT_REPORT;
    }
}

/*********************************************************************
 * Function: void APP_HostHIDKeyboardInitialize(void);
 *
 * Overview: Initializes the demo code
 *
 * PreCondition: None
 *
 * Input: None
 *
 * Output: None
 *
 ********************************************************************/
void APP_HostHIDKeyboardInitialize() {
    pickit.state = DEVICE_NOT_CONNECTED;
    pickit.goSEND_OUTPUT_REPORT = false;
    pickit.inUse = false;
    pickit.buffer = NULL;
}

/*********************************************************************
 * Function: void APP_HostHIDKeyboardTasks(void);
 *
 * Overview: Keeps the demo running.
 *
 * PreCondition: The demo should have been initialized via
 *   the APP_HostHIDKeyboardInitialize()
 *
 * Input: None
 *
 * Output: None
 *
 ********************************************************************/
void APP_HostHIDKeyboardTasks() {
    uint8_t error;
    uint8_t count;

    if (!USBHostHID_ApiDeviceDetect()) {
        if (pickit.state != WAITING_FOR_DEVICE) {
            pickit.state = DEVICE_NOT_CONNECTED;
            
#ifdef DEBUG_MODE
            UART2PrintString("APP: PICkit Disconnected!\n");
#endif
            pickit.inUse = false;

            if (pickit.buffer != NULL) {
                free(pickit.buffer);
                pickit.buffer = NULL;
            }
        }
    }

    switch (pickit.state) {
        case DEVICE_NOT_CONNECTED:
            //PRINT_ClearScreen();
#ifdef DEBUG_MODE
            UART2PrintString("APP: Attach PICkit\n");
#endif            
            pickit.state = WAITING_FOR_DEVICE;
            IEC0bits.U1RXIE=0;
            LED_Off(LED_USB_HOST_HID_KEYBOARD_DEVICE_READY);
            break;

        case WAITING_FOR_DEVICE:
            if (USBHostHID_ApiDeviceDetect()) /* True if report descriptor is parsed with no error */ {
                //PRINT_ClearScreen();
                SYSTEM_Initialize(SYSTEM_STATE_USB_HOST_HID_KEYBOARD);
                LED_On(LED_USB_HOST_HID_KEYBOARD_DEVICE_READY);

                pickit.state = DEVICE_CONNECTED;
                    
                //timwuu 2015.12.31 change control right from timer3 to uart
                TIMER_RequestTick(&APP_HostHIDTimerHandler, 2);  //2ms

            }
            break;

        case DEVICE_CONNECTED:
            break;

        case GET_INPUT_REPORT:
                       
            if (USBHostHID_ApiGetReport(pickit.details.reportID,
                    pickit.details.interfaceNum,
                    pickit.size,
                    pickit.buffer
                    )
                    ) {
                /* Host may be busy/error -- keep trying */
#ifdef DEBUG_MODE
                    UART2PrintString("GET_INPUT_REPORT:BUSY\n");
#endif
            } else {
#ifdef DEBUG_MODE
                    UART2PrintString("GET_INPUT_REPORT:OK\n");
#endif                
                pickit.state = INPUT_REPORT_PENDING;
            }
            break;

        case INPUT_REPORT_PENDING:
            if (USBHostHID_ApiTransferIsComplete(&error, &count)) {
                if (error || (count == 0)) {
#ifdef DEBUG_MODE
                    if(error) UART2PrintString("INPUT_REPORT_PENDING:ERROR\n");
                    if(count==0) UART2PrintString("INPUT_REPORT_PENDING:ZERO\n");
#endif                                 
                    pickit.state = DEVICE_CONNECTED;
                } else {
#ifdef DEBUG_MODE
                    UART2PrintString("INPUT_REPORT_PENDING:OK\n");
#endif
                  
                    UART2PutHex(pickit.buffer[61]);
                    UART2PutHex(pickit.buffer[60]);
                    UART2PutChar(':');
                    
                    pickit.state = DEVICE_CONNECTED;
                    App_ProcessInputReport();
                }
            }
            break;

        case SEND_OUTPUT_REPORT: 
            
            //App_PrepareOutputReport();

            if (USBHostHID_ApiSendReport(pickit.details.reportID,
                    pickit.details.interfaceNum,
                    pickit.size,
                    (uint8_t *)cmdBuffer)) {
                    //pickit.buffer)) {
                /* Host may be busy/error -- keep trying */
#ifdef DEBUG_MODE
                    UART2PrintString("SEND_OUTPUT_REPORT:BUSY\n");
#endif

            } else {
#ifdef DEBUG_MODE
                    UART2PrintString("SEND_OUTPUT_REPORT:OK\n");
#endif
                UB_SetCmdBufferStateEmpty();
                pickit.state = OUTPUT_REPORT_PENDING;
            }
            break;

        case OUTPUT_REPORT_PENDING:
            //timijk 2016.01.13 Issue
            if (USBHostHID_ApiTransferIsComplete(&error, &count)) {
#ifdef DEBUG_MODE
                    UART2PrintString("OUTPUT_REPORT_PENDING\n");
#endif
                //?timwuu 2016.01.02  signal the device is ready for the next command
//                if(error) {
//                    UART2PutChar('*');
//                    UART2PutHex(error);
//                    LATBbits.LATB15 =1;
//                    pickit.state = SEND_OUTPUT_REPORT;  //resent the data
//                }
//                else
//                {
                    U1TXREG = 0x00; //LENGTH ZERO DATA
                    pickit.state = DEVICE_CONNECTED;
//                }
            }
                
            break;

        case ERROR_REPORTED:
            break;

        default:
            break;

    }
}

/****************************************************************************
  Function:
    BOOL USB_HID_DataCollectionHandler(void)
  Description:
    This function is invoked by HID client , purpose is to collect the
    details extracted from the report descriptor. HID client will store
    information extracted from the report descriptor in data structures.
    Application needs to create object for each report type it needs to
    extract.
    For ex: HID_DATA_DETAILS pickit.keys.modifier.details;
    HID_DATA_DETAILS is defined in file usb_host_hid_appl_interface.h
    Each member of the structure must be initialized inside this function.
    Application interface layer provides functions :
    USBHostHID_ApiFindBit()
    USBHostHID_ApiFindValue()
    These functions can be used to fill in the details as shown in the demo
    code.

  Precondition:
    None

  Parameters:
    None

  Return Values:
    true    - If the report details are collected successfully.
    false   - If the application does not find the the supported format.

  Remarks:
    This Function name should be entered in the USB configuration tool
    in the field "Parsed Data Collection handler".
    If the application does not define this function , then HID cient
    assumes that Application is aware of report format of the attached
    device.
 ***************************************************************************/
bool APP_HostHIDKeyboardReportParser(void) {
    uint8_t NumOfReportItem = 0;
    uint8_t i;
    USB_HID_ITEM_LIST* pitemListPtrs;
    USB_HID_DEVICE_RPT_INFO* pDeviceRptinfo;
    HID_REPORTITEM *reportItem;
    HID_USAGEITEM *hidUsageItem;
    //uint8_t usageIndex;
   // uint8_t reportIndex;
   // uint8_t usageItem;
    
    /* The pickit is already in use. */
    if (pickit.inUse == true) {

        //PRINT_String( "-In Use-\r\n",10);
        return false;
    }

    pDeviceRptinfo = USBHostHID_GetCurrentReportInfo(); // Get current Report Info pointer
    pitemListPtrs = USBHostHID_GetItemListPointers(); // Get pointer to list of item pointers

    /* Find Report Item Index for Modifier Keys */
    /* Once report Item is located , extract information from data structures provided by the parser */
    NumOfReportItem = pDeviceRptinfo->reportItems;

#ifdef DEBUG_MODE
    UART2PrintString("APP: NumOfReportItem:");
    UART2PutHex(NumOfReportItem);
    UART2PutChar('\n');

    USBHID_ReportDecriptor_Dump();
#endif
    
    reportItem = &pitemListPtrs->reportItemList[0];
    
    pickit.details.reportLength = 64; // (pitemListPtrs->reportList[reportIndex].inputBits + 7) / 8;
    pickit.details.reportID = (uint8_t) reportItem->globals.reportID;
    pickit.details.bitOffset = (uint8_t) reportItem->startBit;
    pickit.details.bitLength = (uint8_t) reportItem->globals.reportsize;
    pickit.details.count = (uint8_t) reportItem->globals.reportCount;
    pickit.details.interfaceNum = USBHostHID_ApiGetCurrentInterfaceNum();

    pickit.size = 64;
    pickit.buffer = (uint8_t*) malloc(pickit.size);
    pickit.inUse = true;

    return (pickit.inUse);
}

/****************************************************************************
  Function:
    void App_ProcessInputReport(void)

  Description:
    This function processes input report received from HID device.

  Precondition:
    None

  Parameters:
    None

  Return Values:
    None

  Remarks:
    None
 ***************************************************************************/
static void App_ProcessInputReport(void) {
    UB_PrepareResponseBuffer( pickit.buffer);
}

//void UB_PrepareOutputReport( uint8_t *buffer);

static void App_PrepareOutputReport(void) {
    UB_PrepareOutputReport( pickit.buffer);
}

void App_SetReportState(uint8_t io) {

    if (io) {
        if (pickit.state == DEVICE_CONNECTED) pickit.state = GET_INPUT_REPORT;
    } else {
        if (pickit.state == DEVICE_CONNECTED) pickit.state = SEND_OUTPUT_REPORT;
        else if ((pickit.state == GET_INPUT_REPORT) || (pickit.state == INPUT_REPORT_PENDING)) {
            pickit.goSEND_OUTPUT_REPORT = true;
        }
    }            
  
}