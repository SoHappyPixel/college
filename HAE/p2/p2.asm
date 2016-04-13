
_main:

;p2.c,1 :: 		void main()
;p2.c,3 :: 		int i=0;
	CLRF        main_i_L0+0 
	CLRF        main_i_L0+1 
	CLRF        main_TENS_L0+0 
	CLRF        main_UNITS_L0+0 
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
;p2.c,8 :: 		TRISA = 0;
	CLRF        TRISA+0 
;p2.c,9 :: 		TRISD = 0;
	CLRF        TRISD+0 
;p2.c,10 :: 		PORTA = 0;
	CLRF        PORTA+0 
;p2.c,11 :: 		PORTD = 0;
	CLRF        PORTD+0 
;p2.c,13 :: 		while(1)
L_main0:
;p2.c,15 :: 		for(i=0; i<50; i++) //1sec (1/50)
	CLRF        main_i_L0+0 
	CLRF        main_i_L0+1 
L_main2:
	MOVLW       128
	XORWF       main_i_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main10
	MOVLW       50
	SUBWF       main_i_L0+0, 0 
L__main10:
	BTFSC       STATUS+0, 0 
	GOTO        L_main3
;p2.c,17 :: 		PORTD = hex[UNITS];
	MOVLW       main_hex_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(main_hex_L0+0)
	MOVWF       FSR0H 
	MOVF        main_UNITS_L0+0, 0 
	ADDWF       FSR0, 1 
	MOVLW       0
	BTFSC       main_UNITS_L0+0, 7 
	MOVLW       255
	ADDWFC      FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTD+0 
;p2.c,18 :: 		PORTA = 0x01;
	MOVLW       1
	MOVWF       PORTA+0 
;p2.c,20 :: 		DELAY_MS(10);
	MOVLW       26
	MOVWF       R12, 0
	MOVLW       248
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	DECFSZ      R12, 1, 1
	BRA         L_main5
	NOP
;p2.c,21 :: 		PORTA = 0;
	CLRF        PORTA+0 
;p2.c,22 :: 		PORTD = hex[TENS];
	MOVLW       main_hex_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(main_hex_L0+0)
	MOVWF       FSR0H 
	MOVF        main_TENS_L0+0, 0 
	ADDWF       FSR0, 1 
	MOVLW       0
	BTFSC       main_TENS_L0+0, 7 
	MOVLW       255
	ADDWFC      FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTD+0 
;p2.c,23 :: 		PORTA = 0x02;
	MOVLW       2
	MOVWF       PORTA+0 
;p2.c,24 :: 		DELAY_MS(10);
	MOVLW       26
	MOVWF       R12, 0
	MOVLW       248
	MOVWF       R13, 0
L_main6:
	DECFSZ      R13, 1, 1
	BRA         L_main6
	DECFSZ      R12, 1, 1
	BRA         L_main6
	NOP
;p2.c,25 :: 		PORTA = 0;
	CLRF        PORTA+0 
;p2.c,15 :: 		for(i=0; i<50; i++) //1sec (1/50)
	INFSNZ      main_i_L0+0, 1 
	INCF        main_i_L0+1, 1 
;p2.c,26 :: 		}
	GOTO        L_main2
L_main3:
;p2.c,28 :: 		UNITS++;
	INCF        main_UNITS_L0+0, 1 
;p2.c,30 :: 		if(UNITS == 10)
	MOVF        main_UNITS_L0+0, 0 
	XORLW       10
	BTFSS       STATUS+0, 2 
	GOTO        L_main7
;p2.c,32 :: 		UNITS = 0;
	CLRF        main_UNITS_L0+0 
;p2.c,33 :: 		TENS++;
	INCF        main_TENS_L0+0, 1 
;p2.c,35 :: 		if(TENS == 6) TENS = 0;
	MOVF        main_TENS_L0+0, 0 
	XORLW       6
	BTFSS       STATUS+0, 2 
	GOTO        L_main8
	CLRF        main_TENS_L0+0 
L_main8:
;p2.c,36 :: 		}
L_main7:
;p2.c,37 :: 		}
	GOTO        L_main0
;p2.c,39 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
