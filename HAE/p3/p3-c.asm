
_interrupt:

;p3-c.c,3 :: 		void interrupt()
;p3-c.c,5 :: 		INTCON.INT0IF = 0;
	BCF         INTCON+0, 1 
;p3-c.c,6 :: 		UNITS++;
	INCF        _UNITS+0, 1 
;p3-c.c,7 :: 		if(UNITS == 10)
	MOVF        _UNITS+0, 0 
	XORLW       10
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt0
;p3-c.c,9 :: 		UNITS = 0; TENS++;
	CLRF        _UNITS+0 
	INCF        _TENS+0, 1 
;p3-c.c,10 :: 		if(TENS == 10) TENS = 0;
	MOVF        _TENS+0, 0 
	XORLW       10
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt1
	CLRF        _TENS+0 
L_interrupt1:
;p3-c.c,11 :: 		}
L_interrupt0:
;p3-c.c,12 :: 		}
L_end_interrupt:
L__interrupt7:
	RETFIE      1
; end of _interrupt

_main:

;p3-c.c,14 :: 		void main() {
;p3-c.c,15 :: 		char hex[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x67};
	MOVLW       63
	MOVWF       main_hex_L0+0 
	MOVLW       6
	MOVWF       main_hex_L0+1 
	MOVLW       91
	MOVWF       main_hex_L0+2 
	MOVLW       79
	MOVWF       main_hex_L0+3 
	MOVLW       102
	MOVWF       main_hex_L0+4 
	MOVLW       109
	MOVWF       main_hex_L0+5 
	MOVLW       125
	MOVWF       main_hex_L0+6 
	MOVLW       7
	MOVWF       main_hex_L0+7 
	MOVLW       127
	MOVWF       main_hex_L0+8 
	MOVLW       103
	MOVWF       main_hex_L0+9 
;p3-c.c,17 :: 		TRISC = 0;
	CLRF        TRISC+0 
;p3-c.c,18 :: 		TRISD = 0;
	CLRF        TRISD+0 
;p3-c.c,19 :: 		TRISB.B0 = 1;
	BSF         TRISB+0, 0 
;p3-c.c,21 :: 		PORTC = 0;
	CLRF        PORTC+0 
;p3-c.c,22 :: 		PORTD = 0;
	CLRF        PORTD+0 
;p3-c.c,23 :: 		PORTB.B0 = 0;
	BCF         PORTB+0, 0 
;p3-c.c,25 :: 		INTCON2 = 0;
	CLRF        INTCON2+0 
;p3-c.c,26 :: 		INTCON.INT0IF = 0;
	BCF         INTCON+0, 1 
;p3-c.c,27 :: 		INTCON.INT0IE = 1;
	BSF         INTCON+0, 4 
;p3-c.c,28 :: 		INTCON.GIE = 1;
	BSF         INTCON+0, 7 
;p3-c.c,30 :: 		while(1)
L_main2:
;p3-c.c,32 :: 		PORTD = 0xFD;
	MOVLW       253
	MOVWF       PORTD+0 
;p3-c.c,33 :: 		PORTC = hex[UNITS];
	MOVLW       main_hex_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(main_hex_L0+0)
	MOVWF       FSR0H 
	MOVF        _UNITS+0, 0 
	ADDWF       FSR0, 1 
	MOVLW       0
	BTFSC       _UNITS+0, 7 
	MOVLW       255
	ADDWFC      FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTC+0 
;p3-c.c,34 :: 		DELAY_MS(24);
	MOVLW       63
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main4:
	DECFSZ      R13, 1, 1
	BRA         L_main4
	DECFSZ      R12, 1, 1
	BRA         L_main4
;p3-c.c,36 :: 		PORTD = 0xFE;
	MOVLW       254
	MOVWF       PORTD+0 
;p3-c.c,37 :: 		PORTC = hex[TENS];
	MOVLW       main_hex_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(main_hex_L0+0)
	MOVWF       FSR0H 
	MOVF        _TENS+0, 0 
	ADDWF       FSR0, 1 
	MOVLW       0
	BTFSC       _TENS+0, 7 
	MOVLW       255
	ADDWFC      FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTC+0 
;p3-c.c,38 :: 		DELAY_MS(24);
	MOVLW       63
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	DECFSZ      R12, 1, 1
	BRA         L_main5
;p3-c.c,39 :: 		}
	GOTO        L_main2
;p3-c.c,40 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
