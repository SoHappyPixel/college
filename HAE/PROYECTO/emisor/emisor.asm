
_interrupt:

;emisor.c,6 :: 		void interrupt()
;emisor.c,8 :: 		if(INTCON.RBIF == 1 )
	BTFSS       INTCON+0, 0 
	GOTO        L_interrupt0
;emisor.c,10 :: 		x = PORTB; // RBIF exige antes leer PORTB.
	MOVF        PORTB+0, 0 
	MOVWF       _x+0 
;emisor.c,11 :: 		flag = ~flag; // Control entrada low/high.
	COMF        _flag+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       _flag+0 
;emisor.c,12 :: 		INTCON.RBIF = 0; // Se apaga la interrupción.
	BCF         INTCON+0, 0 
;emisor.c,15 :: 		if(flag)
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupt1
;emisor.c,17 :: 		T0CON = 0x90; // Se enciende el timer.
	MOVLW       144
	MOVWF       T0CON+0 
;emisor.c,18 :: 		TMR0H = 0; // Valor high para el alfa del timer.
	CLRF        TMR0H+0 
;emisor.c,19 :: 		TMR0L = 0; // Valor low para el alfa del timer.
	CLRF        TMR0L+0 
;emisor.c,20 :: 		}
L_interrupt1:
;emisor.c,23 :: 		if(!flag)
	MOVF        _flag+0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt2
;emisor.c,25 :: 		T0CON = 0x10; // Se apaga el timer.
	MOVLW       16
	MOVWF       T0CON+0 
;emisor.c,26 :: 		UART1_Write(TMR0L); // Envio TMR0L via UART.
	MOVF        TMR0L+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;emisor.c,27 :: 		UART1_Write(TMR0H); // Envio TMR0H via UART.
	MOVF        TMR0H+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;emisor.c,28 :: 		}
L_interrupt2:
;emisor.c,29 :: 		}
L_interrupt0:
;emisor.c,30 :: 		}
L_end_interrupt:
L__interrupt9:
	RETFIE      1
; end of _interrupt

_main:

;emisor.c,34 :: 		void main()
;emisor.c,37 :: 		TRISB = 0x10; // (I)ECHO->rb4 : (O)TRIGGER->rb0.
	MOVLW       16
	MOVWF       TRISB+0 
;emisor.c,38 :: 		TRISC = 0x00; // Pines de C como Output.
	CLRF        TRISC+0 
;emisor.c,39 :: 		PORTB = 0x00; // Datos en B a 0.
	CLRF        PORTB+0 
;emisor.c,40 :: 		PORTC = 0x00; // Datos en C a 0.
	CLRF        PORTC+0 
;emisor.c,43 :: 		x = PORTB; // RBIF exige antes leer PORTB.
	MOVF        PORTB+0, 0 
	MOVWF       _x+0 
;emisor.c,44 :: 		INTCON.RBIF = 0; // Flag de activación apagado.
	BCF         INTCON+0, 0 
;emisor.c,45 :: 		INTCON.RBIE = 1; // Interrupciones en B a low/high.
	BSF         INTCON+0, 3 
;emisor.c,48 :: 		INTCON.TMR0IF = 0; // Flag de activación apagado.
	BCF         INTCON+0, 2 
;emisor.c,49 :: 		INTCON.TMR0IE = 1; // Se permite que el timer lance interrupciones.
	BSF         INTCON+0, 5 
;emisor.c,52 :: 		RCON.IPEN = 0; // Sin prioridad.
	BCF         RCON+0, 7 
;emisor.c,53 :: 		INTCON.PEIE = 0; // Tipo core.
	BCF         INTCON+0, 6 
;emisor.c,54 :: 		INTCON.GIE = 1; // Interrupciones globales.
	BSF         INTCON+0, 7 
;emisor.c,57 :: 		T0CON = 0x10; // Se apaga el timer.
	MOVLW       16
	MOVWF       T0CON+0 
;emisor.c,58 :: 		TMR0H = 0; // Valor high para el alfa del timer.
	CLRF        TMR0H+0 
;emisor.c,59 :: 		TMR0L = 0; // Valor low para el alfa del timer.
	CLRF        TMR0L+0 
;emisor.c,62 :: 		UART1_Init(9600);
	MOVLW       51
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;emisor.c,63 :: 		delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
	DECFSZ      R11, 1, 1
	BRA         L_main3
	NOP
	NOP
;emisor.c,66 :: 		while(1)
L_main4:
;emisor.c,68 :: 		PORTB.B0 = 1;
	BSF         PORTB+0, 0 
;emisor.c,69 :: 		delay_us(10);
	MOVLW       6
	MOVWF       R13, 0
L_main6:
	DECFSZ      R13, 1, 1
	BRA         L_main6
	NOP
;emisor.c,70 :: 		PORTB.B0 = 0;
	BCF         PORTB+0, 0 
;emisor.c,71 :: 		delay_ms(1500);
	MOVLW       16
	MOVWF       R11, 0
	MOVLW       57
	MOVWF       R12, 0
	MOVLW       13
	MOVWF       R13, 0
L_main7:
	DECFSZ      R13, 1, 1
	BRA         L_main7
	DECFSZ      R12, 1, 1
	BRA         L_main7
	DECFSZ      R11, 1, 1
	BRA         L_main7
	NOP
	NOP
;emisor.c,72 :: 		}
	GOTO        L_main4
;emisor.c,73 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
