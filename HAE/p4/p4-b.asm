
_interrupt:

;p4-b.c,3 :: 		void interrupt()
;p4-b.c,5 :: 		INTCON.INT0IF = 0;
	BCF         INTCON+0, 1 
;p4-b.c,7 :: 		if(flag == 0)
	MOVF        _flag+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt0
;p4-b.c,9 :: 		PORTC = 0x0C;
	MOVLW       12
	MOVWF       PORTC+0 
;p4-b.c,10 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_interrupt1:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt1
	DECFSZ      R12, 1, 1
	BRA         L_interrupt1
	DECFSZ      R11, 1, 1
	BRA         L_interrupt1
	NOP
;p4-b.c,11 :: 		PORTC = 0x09;
	MOVLW       9
	MOVWF       PORTC+0 
;p4-b.c,12 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_interrupt2:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt2
	DECFSZ      R12, 1, 1
	BRA         L_interrupt2
	DECFSZ      R11, 1, 1
	BRA         L_interrupt2
	NOP
;p4-b.c,13 :: 		PORTC = 0x03;
	MOVLW       3
	MOVWF       PORTC+0 
;p4-b.c,14 :: 		flag = 1;
	MOVLW       1
	MOVWF       _flag+0 
;p4-b.c,15 :: 		}
	GOTO        L_interrupt3
L_interrupt0:
;p4-b.c,19 :: 		PORTC = 0x09;
	MOVLW       9
	MOVWF       PORTC+0 
;p4-b.c,20 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_interrupt4:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt4
	DECFSZ      R12, 1, 1
	BRA         L_interrupt4
	DECFSZ      R11, 1, 1
	BRA         L_interrupt4
	NOP
;p4-b.c,21 :: 		PORTC = 0x0C;
	MOVLW       12
	MOVWF       PORTC+0 
;p4-b.c,22 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_interrupt5:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt5
	DECFSZ      R12, 1, 1
	BRA         L_interrupt5
	DECFSZ      R11, 1, 1
	BRA         L_interrupt5
	NOP
;p4-b.c,23 :: 		PORTC = 0x06;
	MOVLW       6
	MOVWF       PORTC+0 
;p4-b.c,24 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_interrupt6:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt6
	DECFSZ      R12, 1, 1
	BRA         L_interrupt6
	DECFSZ      R11, 1, 1
	BRA         L_interrupt6
	NOP
;p4-b.c,25 :: 		PORTC = 0x03;
	MOVLW       3
	MOVWF       PORTC+0 
;p4-b.c,26 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_interrupt7:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt7
	DECFSZ      R12, 1, 1
	BRA         L_interrupt7
	DECFSZ      R11, 1, 1
	BRA         L_interrupt7
	NOP
;p4-b.c,27 :: 		PORTC = 0x09;
	MOVLW       9
	MOVWF       PORTC+0 
;p4-b.c,28 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_interrupt8:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt8
	DECFSZ      R12, 1, 1
	BRA         L_interrupt8
	DECFSZ      R11, 1, 1
	BRA         L_interrupt8
	NOP
;p4-b.c,29 :: 		PORTC = 0x0C;
	MOVLW       12
	MOVWF       PORTC+0 
;p4-b.c,30 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_interrupt9:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt9
	DECFSZ      R12, 1, 1
	BRA         L_interrupt9
	DECFSZ      R11, 1, 1
	BRA         L_interrupt9
	NOP
;p4-b.c,31 :: 		PORTC = 0x06;
	MOVLW       6
	MOVWF       PORTC+0 
;p4-b.c,32 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_interrupt10:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt10
	DECFSZ      R12, 1, 1
	BRA         L_interrupt10
	DECFSZ      R11, 1, 1
	BRA         L_interrupt10
	NOP
;p4-b.c,33 :: 		PORTC = 0x03;
	MOVLW       3
	MOVWF       PORTC+0 
;p4-b.c,34 :: 		}
L_interrupt3:
;p4-b.c,35 :: 		}
L_end_interrupt:
L__interrupt12:
	RETFIE      1
; end of _interrupt

_main:

;p4-b.c,37 :: 		void main()
;p4-b.c,39 :: 		INTCON.INT0IF = 0;
	BCF         INTCON+0, 1 
;p4-b.c,40 :: 		INTCON.INT0IE = 1;
	BSF         INTCON+0, 4 
;p4-b.c,41 :: 		INTCON.GIE = 1;
	BSF         INTCON+0, 7 
;p4-b.c,43 :: 		TRISB=1;
	MOVLW       1
	MOVWF       TRISB+0 
;p4-b.c,44 :: 		TRISC=0;
	CLRF        TRISC+0 
;p4-b.c,46 :: 		PORTC = 0x01;
	MOVLW       1
	MOVWF       PORTC+0 
;p4-b.c,47 :: 		PORTC = 0x02;
	MOVLW       2
	MOVWF       PORTC+0 
;p4-b.c,48 :: 		PORTC = 0x06;
	MOVLW       6
	MOVWF       PORTC+0 
;p4-b.c,49 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
