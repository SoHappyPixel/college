
_interrupt:

;receptor.c,23 :: 		void interrupt()
;receptor.c,25 :: 		if(PIR1.RCIF == 1)
	BTFSS       PIR1+0, 5 
	GOTO        L_interrupt0
;receptor.c,27 :: 		input = UART1_Read();
	CALL        _UART1_Read+0, 0
	CALL        _byte2double+0, 0
	MOVF        R0, 0 
	MOVWF       _input+0 
	MOVF        R1, 0 
	MOVWF       _input+1 
	MOVF        R2, 0 
	MOVWF       _input+2 
	MOVF        R3, 0 
	MOVWF       _input+3 
;receptor.c,28 :: 		delay_ms(50);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_interrupt1:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt1
	DECFSZ      R12, 1, 1
	BRA         L_interrupt1
	NOP
	NOP
;receptor.c,29 :: 		input = input + (UART1_Read() << 8); // Se caputra el valor bajo timer.
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       R5 
	CLRF        R4 
	MOVF        R4, 0 
	MOVWF       R0 
	MOVF        R5, 0 
	MOVWF       R1 
	CALL        _word2double+0, 0
	MOVF        _input+0, 0 
	MOVWF       R4 
	MOVF        _input+1, 0 
	MOVWF       R5 
	MOVF        _input+2, 0 
	MOVWF       R6 
	MOVF        _input+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _input+0 
	MOVF        R1, 0 
	MOVWF       _input+1 
	MOVF        R2, 0 
	MOVWF       _input+2 
	MOVF        R3, 0 
	MOVWF       _input+3 
;receptor.c,30 :: 		FloatToStr(input*(1.6570e-2),output); // Se captura el valor alto del timer.
	MOVLW       207
	MOVWF       R4 
	MOVLW       189
	MOVWF       R5 
	MOVLW       7
	MOVWF       R6 
	MOVLW       121
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_FloatToStr_fnum+0 
	MOVF        R1, 0 
	MOVWF       FARG_FloatToStr_fnum+1 
	MOVF        R2, 0 
	MOVWF       FARG_FloatToStr_fnum+2 
	MOVF        R3, 0 
	MOVWF       FARG_FloatToStr_fnum+3 
	MOVLW       _output+0
	MOVWF       FARG_FloatToStr_str+0 
	MOVLW       hi_addr(_output+0)
	MOVWF       FARG_FloatToStr_str+1 
	CALL        _FloatToStr+0, 0
;receptor.c,31 :: 		Lcd_Cmd(_LCD_CLEAR); // Se limpia lo que mueste la pantalla.
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;receptor.c,32 :: 		LCD_out(1,1,output); // Se imprime la distancia en pantalla.
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _output+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_output+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;receptor.c,33 :: 		}
L_interrupt0:
;receptor.c,34 :: 		PIR1.RCIF = 0; // Se apaga la interrupción del UART.
	BCF         PIR1+0, 5 
;receptor.c,35 :: 		}
L_end_interrupt:
L__interrupt6:
	RETFIE      1
; end of _interrupt

_main:

;receptor.c,38 :: 		void main()
;receptor.c,41 :: 		TRISC.B7 = 1;
	BSF         TRISC+0, 7 
;receptor.c,42 :: 		PORTC.B7 = 0;
	BCF         PORTC+0, 7 
;receptor.c,45 :: 		RCON.IPEN = 0;
	BCF         RCON+0, 7 
;receptor.c,46 :: 		PIR1.RCIF = 0;
	BCF         PIR1+0, 5 
;receptor.c,47 :: 		PIE1.RCIE = 1;
	BSF         PIE1+0, 5 
;receptor.c,48 :: 		INTCON.PEIE = 1;
	BSF         INTCON+0, 6 
;receptor.c,49 :: 		INTCON.GIE = 1;
	BSF         INTCON+0, 7 
;receptor.c,52 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;receptor.c,55 :: 		UART1_Init(9600);
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       207
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;receptor.c,56 :: 		delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_main2:
	DECFSZ      R13, 1, 1
	BRA         L_main2
	DECFSZ      R12, 1, 1
	BRA         L_main2
	DECFSZ      R11, 1, 1
	BRA         L_main2
	NOP
	NOP
;receptor.c,59 :: 		while(1) {}
L_main3:
	GOTO        L_main3
;receptor.c,60 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
