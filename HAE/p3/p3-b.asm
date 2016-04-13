
_interrupt:

;p3-b.c,1 :: 		void interrupt()
;p3-b.c,3 :: 		INTCON.INT0IF = 0;
	BCF         INTCON+0, 1 
;p3-b.c,4 :: 		if(PORTB.B1 == 1) PORTB.B1 = 0;
	BTFSS       PORTB+0, 1 
	GOTO        L_interrupt0
	BCF         PORTB+0, 1 
	GOTO        L_interrupt1
L_interrupt0:
;p3-b.c,5 :: 		else PORTB.B1 = 1;
	BSF         PORTB+0, 1 
L_interrupt1:
;p3-b.c,6 :: 		}
L_end_interrupt:
L__interrupt5:
	RETFIE      1
; end of _interrupt

_main:

;p3-b.c,8 :: 		void main()
;p3-b.c,10 :: 		TRISB.B0= 0x01;
	BSF         TRISB+0, 0 
;p3-b.c,11 :: 		TRISB.B1= 0;
	BCF         TRISB+0, 1 
;p3-b.c,12 :: 		PORTB.B1= 0;
	BCF         PORTB+0, 1 
;p3-b.c,14 :: 		INTCON2 = 0;
	CLRF        INTCON2+0 
;p3-b.c,15 :: 		INTCON.INT0IF = 0;
	BCF         INTCON+0, 1 
;p3-b.c,16 :: 		INTCON.INT0IE = 0x01;
	BSF         INTCON+0, 4 
;p3-b.c,17 :: 		INTCON.GIE = 0x01;
	BSF         INTCON+0, 7 
;p3-b.c,19 :: 		while(1)
L_main2:
;p3-b.c,21 :: 		asm nop;
	NOP
;p3-b.c,22 :: 		}
	GOTO        L_main2
;p3-b.c,24 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
