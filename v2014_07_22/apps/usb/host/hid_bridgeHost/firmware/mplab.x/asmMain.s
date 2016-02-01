
    .equ __24FJ64GB002,1
    ;.include "p24FJ64GB002.inc"
    .include "xc.inc"
    .list

;------- 19200 --------
    ;.equ UART_U1BRG, 0x33  ;BRGH=0,19200
    ;.equ UART_U1BRG, 0x22   ;BRGH=1,115200
    .equ UART_U1BRG, 0x07   ;BRGH=1,500k
    
    .equ UART_U2BRG, 0x33  ;BRGH=0,19200
    
    .extern _U1RXISR

    .global _InitUART
    .global _ConfigurePinReMap

; U1RX:RP8, U1TX:RP7
_ConfigurePinReMap:
        MOV #OSCCON, w1
        MOV #0x46, W2
        MOV #0x57, W3
        MOV.B W2, [W1]
        MOV.B W3, [W1]
        BCLR OSCCON, #IOLOCK

        ;U1CTS to Vss, U1Rx to PIN17, RP8, 5.5V Tolerant
        MOV #0xFF08, W1
        MOV W1, RPINR18

        ;NULL to PIN RP, U1TX(3) to PIN16 RP7, 5.5V Tolerant
        MOV #0x0300, W1
        MOV W1, RPOR3
	
	;U2CTS to Vss, U2Rx to PIN25, RP14
        MOV #0xFF0E, W1
        MOV W1, RPINR19

        ;NULL to PIN RP, U2TX(5) to PIN24 RP13
        MOV #0x0500, W1
        MOV W1, RPOR6
	

        MOV #OSCCON, w1
        MOV #0x46, W2
        MOV #0x57, W3
        MOV.B W2, [W1]
        MOV.B W3, [W1]
        BSET OSCCON, #IOLOCK

        RETURN

;<editor-fold defaultstate="collapsed" desc="InitUART">
; AT COMMAND (NO \n\r)
; 1.AT
; 2.AT+NAME
; 3.AT+PIN
; 4.AT+BAUD5    (for 19200)
;   AT+BAUDC    (for 1382400)
_InitUART:

    BCLR IEC0, #U1RXIE

;U1MODE<9:8>:00, UxATX,UxARX Enabled and Used Only
;U1MODE<3>:0, Standard Mode
;U1MODE<2:1>:00, 8-bit data, no parity
;U1MODE<0>:0, 1 stop bit
    MOV #0x0008, W0   ;BRGH:1, fix BAUD RATE
    MOV W0, U1MODE

    MOV #UART_U1BRG, W0
    MOV W0, U1BRG

    BSET IPC2, #U1RXIP0
    BCLR IPC2, #U1RXIP1
    BCLR IPC2, #U1RXIP2
    BCLR IFS0, #U1RXIF
    BSET IEC0, #U1RXIE

    BSET U1MODE, #UARTEN  ;Enable UART
    BSET U1STA, #UTXEN    ;Enable Tx

    ;SETUP U2
    
    BCLR IEC1, #U2RXIE

;U1MODE<9:8>:00, UxATX,UxARX Enabled and Used Only
;U1MODE<3>:0, Standard Mode
;U1MODE<2:1>:00, 8-bit data, no parity
;U1MODE<0>:0, 1 stop bit
    MOV #0x0000, W0   ;BRGH:0, fix BAUD RATE
    MOV W0, U2MODE

    MOV #UART_U2BRG, W0
    MOV W0, U2BRG

    ;BSET IPC2, #U2RXIP0
    ;BCLR IPC2, #U2RXIP1
    ;BCLR IPC2, #U2RXIP2
    ;BCLR IFS0, #U2RXIF
    ;BSET IEC0, #U2RXIE

    BSET U2MODE, #UARTEN  ;Enable UART
    BSET U2STA, #UTXEN    ;Enable Tx

    RETURN;;</editor-fold>

.end
