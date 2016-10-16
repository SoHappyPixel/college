
_interrupt:

;p5-b.c,19 :: 		void interrupt()
;p5-b.c,21 :: 		if(portb.b4==0)
	BTFSC       PORTB+0, 4 
	GOTO        L_interrupt0
;p5-b.c,23 :: 		cont++;
	INCF        _cont+0, 1 
;p5-b.c,24 :: 		if(cont==100) cont = 0;
	MOVF        _cont+0, 0 
	XORLW       100
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt1
	CLRF        _cont+0 
L_interrupt1:
;p5-b.c,25 :: 		ByteToStr(cont,txt);
	MOVF        _cont+0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       _txt+0
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
;p5-b.c,26 :: 		Lcd_out(1,1,txt);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;p5-b.c,27 :: 		}
L_interrupt0:
;p5-b.c,28 :: 		x=PORTB;
	MOVF        PORTB+0, 0 
	MOVWF       _x+0 
;p5-b.c,29 :: 		INTCON.RBIF=0;
	BCF         INTCON+0, 0 
;p5-b.c,30 :: 		}
L_end_interrupt:
L__interrupt5:
	RETFIE      1
; end of _interrupt

_main:

;p5-b.c,32 :: 		void main()
;p5-b.c,34 :: 		TRISB=0xF0;
	MOVLW       240
	MOVWF       TRISB+0 
;p5-b.c,35 :: 		PORTB=0;
	CLRF        PORTB+0 
;p5-b.c,36 :: 		INTCON2.RBPU=0;
	BCF         INTCON2+0, 7 
;p5-b.c,37 :: 		x=PORTB;
	MOVF        PORTB+0, 0 
	MOVWF       _x+0 
;p5-b.c,38 :: 		INTCON.RBIF=0;
	BCF         INTCON+0, 0 
;p5-b.c,39 :: 		INTCON.RBIE=1;
	BSF         INTCON+0, 3 
;p5-b.c,40 :: 		INTCON.GIE=1;
	BSF         INTCON+0, 7 
;p5-b.c,42 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;p5-b.c,43 :: 		interrupt();
	CALL        _interrupt+0, 0
;p5-b.c,44 :: 		while(1);
L_main2:
	GOTO        L_main2
;p5-b.c,45 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
