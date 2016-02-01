/******************************************************************************
Software License Agreement

The software supplied herewith by Microchip Technology Incorporated
(the "Company") for its PIC(R) Microcontroller is intended and
supplied to you, the Company's customer, for use solely and
exclusively on Microchip PICmicro Microcontroller products. The
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
 *******************************************************************************/

#include <xc.h>
#include <uart.h>
#include <stdint.h>

/* Private variables ************************************************/

#define BUFFER_SIZE 256
volatile int bufferCnt;
char buffer[BUFFER_SIZE];

/*********************************************************************
 * Function: bool UART_Initialize(void);
 *
 * Overview: Initializes the UART screen.  Can take several hundred
 *           milliseconds.
 *
 * PreCondition: none
 *
 * Input: None
 *
 * Output: true if initialized, false otherwise
 *
 ********************************************************************/
bool UART_Initialize(void) {

    bufferCnt = 0;
    InitUART();

    return true;
}

/*********************************************************************
 * Function: void UART_PutString(char* inputString, uint16_t length);
 *
 * Overview: Puts a string on the UART screen.  Unsupported characters will be
 *           discarded.  May block or throw away characters is UART is not ready
 *           or buffer space is not available.  Will terminate when either a
 *           null terminator character (0x00) is reached or the length number
 *           of characters is printed, which ever comes first.
 *
 * PreCondition: already initialized via UART_Initialize()
 *
 * Input: char* - string to print
 *        uint16_t - length of string to print
 *
 * Output: None
 *
 ********************************************************************/
void UART_PutString(char* inputString, uint16_t length) {

    while (length--) buffer[bufferCnt++] = *inputString++;

    UART_Flush();
}

void UART_PutBytes(char* inputString, uint16_t length) {
    while (length--) buffer[bufferCnt++] = *inputString++;
}

/*********************************************************************
 * Function: void UART_PutChar(char);
 *
 * Overview: Puts a character on the UART screen.  Unsupported characters will be
 *           discarded.  May block or throw away characters is UART is not ready
 *           or buffer space is not available.
 *
 * PreCondition: already initialized via UART_Initialize()
 *
 * Input: char - character to print
 *
 * Output: None
 *
 ********************************************************************/
void UART_PutChar(char inputCharacter) {

    buffer[bufferCnt++] = inputCharacter;

    return;
}

/*********************************************************************
 * Function: void UART_ClearScreen(void);
 *
 * Overview: Clears the screen, if possible.
 *
 * PreCondition: already initialized via UART_Initialize()
 *
 * Input: None
 *
 * Output: None
 *
 ********************************************************************/
void UART_ClearScreen(void) {
    while (U1STAbits.UTXBF);
    U1TXREG = '\n';

    return;
}

void UART_Flush(void) {

    int i;

    for (i = 0; i < bufferCnt; i++) {
        while (U1STAbits.UTXBF == 1);
        U1TXREG = buffer[i];
    }

    bufferCnt = 0;
}

void UART2PutChar(char ch) {

    U2TXREG = ch;
    Nop();
    Nop();

    while (U2STAbits.TRMT == 0);
}

const unsigned char CharacterArray[] = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};

void UART2PutHex32( int toPrint) {
    int printVar, i;

    printVar = toPrint;

    for( i=28; i>=0; i=i-4)
    {
         toPrint = (printVar >> i) & 0x0F;
         UART2PutChar(CharacterArray[toPrint]);
    }

    return;
}

void UART2PutHex16( int toPrint) {
    int printVar;

    printVar = toPrint;
    toPrint = (toPrint >> 12) & 0x0F;
    UART2PutChar(CharacterArray[toPrint]);

    toPrint = (printVar >> 8) & 0x0F;
    UART2PutChar(CharacterArray[toPrint]);
    
    toPrint = (printVar >> 4) & 0x0F;
    UART2PutChar(CharacterArray[toPrint]);

    toPrint = printVar & 0x0F;
    UART2PutChar(CharacterArray[toPrint]);

    return;
}

void UART2PutHex( int toPrint) {
    int printVar;

    printVar = toPrint;
    toPrint = (toPrint >> 4) & 0x0F;
    UART2PutChar(CharacterArray[toPrint]);

    toPrint = printVar & 0x0F;
    UART2PutChar(CharacterArray[toPrint]);

    return;
}


void UART2PrintString( char *str )
{
    unsigned char c;

    while( (c = *str++) ) UART2PutChar(c);
}
