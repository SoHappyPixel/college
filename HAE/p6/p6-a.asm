
_interrupt:

;P6-a.c,2 :: 		void interrupt()
;P6-a.c,4 :: 		portc.b0=~portc.b0;
	BTG         PORTC+0, 0 
;P6-a.c,6 :: 		if(flag==0)
	MOVF        _flag+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt0
;P6-a.c,8 :: 		TMR0L = 81;
	MOVLW       81
	MOVWF       TMR0L+0 
;P6-a.c,9 :: 		T0CON = 0xC2;
	MOVLW       194
	MOVWF       T0CON+0 
;P6-a.c,10 :: 		flag = ~flag;
	COMF        _flag+0, 1 
;P6-a.c,11 :: 		}
	GOTO        L_interrupt1
L_interrupt0:
;P6-a.c,14 :: 		TMR0L = 106;
	MOVLW       106
	MOVWF       TMR0L+0 
;P6-a.c,15 :: 		T0CON = 0xC1;
	MOVLW       193
	MOVWF       T0CON+0 
;P6-a.c,16 :: 		flag = ~flag;
	COMF        _flag+0, 1 
;P6-a.c,17 :: 		}
L_interrupt1:
;P6-a.c,18 :: 		intcon.tmr0if=0;
	BCF         INTCON+0, 2 
;P6-a.c,19 :: 		}
L_end_interrupt:
L__interrupt5:
	RETFIE      1
; end of _interrupt

_main:

;P6-a.c,21 :: 		void main()
;P6-a.c,23 :: 		TRISC = 0;
	CLRF        TRISC+0 
;P6-a.c,24 :: 		PORTC = 1;
	MOVLW       1
	MOVWF       PORTC+0 
;P6-a.c,26 :: 		TMR0L = 106;
	MOVLW       106
	MOVWF       TMR0L+0 
;P6-a.c,27 :: 		T0CON = 0xC1;
	MOVLW       193
	MOVWF       T0CON+0 
;P6-a.c,29 :: 		intcon.tmr0if=0;
	BCF         INTCON+0, 2 
;P6-a.c,30 :: 		intcon.tmr0ie=1;
	BSF         INTCON+0, 5 
;P6-a.c,31 :: 		intcon.gie=1;
	BSF         INTCON+0, 7 
;P6-a.c,33 :: 		while(1);
L_main2:
	GOTO        L_main2
;P6-a.c,34 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
