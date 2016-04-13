
_main:

;LedsAutopista.c,1 :: 		void main() {
;LedsAutopista.c,2 :: 		TRISC = 0x00;
	CLRF        TRISC+0 
;LedsAutopista.c,3 :: 		PORTC = 0x00;
	CLRF        PORTC+0 
;LedsAutopista.c,6 :: 		while(1) {
L_main0:
;LedsAutopista.c,8 :: 		PORTC.B0 = 1;
	BSF         PORTC+0, 0 
;LedsAutopista.c,9 :: 		DELAY_MS(500);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
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
;LedsAutopista.c,10 :: 		PORTC.B0 = 0;
	BCF         PORTC+0, 0 
;LedsAutopista.c,11 :: 		PORTC.B1 = 1;
	BSF         PORTC+0, 1 
;LedsAutopista.c,12 :: 		DELAY_MS(500);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
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
;LedsAutopista.c,13 :: 		PORTC.B1 = 0;
	BCF         PORTC+0, 1 
;LedsAutopista.c,14 :: 		PORTC.B2 = 1;
	BSF         PORTC+0, 2 
;LedsAutopista.c,15 :: 		DELAY_MS(500);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main4:
	DECFSZ      R13, 1, 1
	BRA         L_main4
	DECFSZ      R12, 1, 1
	BRA         L_main4
	DECFSZ      R11, 1, 1
	BRA         L_main4
	NOP
	NOP
;LedsAutopista.c,16 :: 		PORTC.B2 = 0;
	BCF         PORTC+0, 2 
;LedsAutopista.c,17 :: 		PORTC.B3 = 1;
	BSF         PORTC+0, 3 
;LedsAutopista.c,18 :: 		DELAY_MS(500);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	DECFSZ      R12, 1, 1
	BRA         L_main5
	DECFSZ      R11, 1, 1
	BRA         L_main5
	NOP
	NOP
;LedsAutopista.c,19 :: 		PORTC.B3 = 0;
	BCF         PORTC+0, 3 
;LedsAutopista.c,20 :: 		PORTC.B4 = 1;
	BSF         PORTC+0, 4 
;LedsAutopista.c,21 :: 		DELAY_MS(500);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main6:
	DECFSZ      R13, 1, 1
	BRA         L_main6
	DECFSZ      R12, 1, 1
	BRA         L_main6
	DECFSZ      R11, 1, 1
	BRA         L_main6
	NOP
	NOP
;LedsAutopista.c,22 :: 		PORTC.B4 = 0;
	BCF         PORTC+0, 4 
;LedsAutopista.c,23 :: 		PORTC.B5 = 1;
	BSF         PORTC+0, 5 
;LedsAutopista.c,24 :: 		DELAY_MS(500);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
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
;LedsAutopista.c,25 :: 		PORTC.B5 = 0;
	BCF         PORTC+0, 5 
;LedsAutopista.c,26 :: 		PORTC.B6 = 1;
	BSF         PORTC+0, 6 
;LedsAutopista.c,27 :: 		DELAY_MS(500);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main8:
	DECFSZ      R13, 1, 1
	BRA         L_main8
	DECFSZ      R12, 1, 1
	BRA         L_main8
	DECFSZ      R11, 1, 1
	BRA         L_main8
	NOP
	NOP
;LedsAutopista.c,28 :: 		PORTC.B6 = 0;
	BCF         PORTC+0, 6 
;LedsAutopista.c,29 :: 		PORTC.B7 = 1;
	BSF         PORTC+0, 7 
;LedsAutopista.c,30 :: 		DELAY_MS(500);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main9:
	DECFSZ      R13, 1, 1
	BRA         L_main9
	DECFSZ      R12, 1, 1
	BRA         L_main9
	DECFSZ      R11, 1, 1
	BRA         L_main9
	NOP
	NOP
;LedsAutopista.c,31 :: 		PORTC.B7 = 0;
	BCF         PORTC+0, 7 
;LedsAutopista.c,33 :: 		}
	GOTO        L_main0
;LedsAutopista.c,34 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
