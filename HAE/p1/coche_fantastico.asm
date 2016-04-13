
_main:

;coche_fantastico.c,1 :: 		void main() {
;coche_fantastico.c,2 :: 		TRISC = 0x00;
	CLRF        TRISC+0 
;coche_fantastico.c,3 :: 		PORTC = 0x00;
	CLRF        PORTC+0 
;coche_fantastico.c,6 :: 		while(1) {
L_main0:
;coche_fantastico.c,8 :: 		PORTC.B0 = 1;
	BSF         PORTC+0, 0 
;coche_fantastico.c,9 :: 		PORTC.B7 = 1;
	BSF         PORTC+0, 7 
;coche_fantastico.c,11 :: 		DELAY_MS(500);
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
;coche_fantastico.c,12 :: 		PORTC.B0 = 0;
	BCF         PORTC+0, 0 
;coche_fantastico.c,13 :: 		PORTC.B7 = 0;
	BCF         PORTC+0, 7 
;coche_fantastico.c,14 :: 		PORTC.B1 = 1;
	BSF         PORTC+0, 1 
;coche_fantastico.c,15 :: 		PORTC.B6 = 1;
	BSF         PORTC+0, 6 
;coche_fantastico.c,17 :: 		DELAY_MS(500);
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
;coche_fantastico.c,18 :: 		PORTC.B1 = 0;
	BCF         PORTC+0, 1 
;coche_fantastico.c,19 :: 		PORTC.B6 = 0;
	BCF         PORTC+0, 6 
;coche_fantastico.c,20 :: 		PORTC.B2 = 1;
	BSF         PORTC+0, 2 
;coche_fantastico.c,21 :: 		PORTC.B5 = 1;
	BSF         PORTC+0, 5 
;coche_fantastico.c,23 :: 		DELAY_MS(500);
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
;coche_fantastico.c,24 :: 		PORTC.B2 = 0;
	BCF         PORTC+0, 2 
;coche_fantastico.c,25 :: 		PORTC.B5 = 0;
	BCF         PORTC+0, 5 
;coche_fantastico.c,26 :: 		PORTC.B3 = 1;
	BSF         PORTC+0, 3 
;coche_fantastico.c,27 :: 		PORTC.B4 = 1;
	BSF         PORTC+0, 4 
;coche_fantastico.c,29 :: 		DELAY_MS(500);
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
;coche_fantastico.c,30 :: 		PORTC.B3 = 0;
	BCF         PORTC+0, 3 
;coche_fantastico.c,31 :: 		PORTC.B4 = 0;
	BCF         PORTC+0, 4 
;coche_fantastico.c,32 :: 		PORTC.B2 = 1;
	BSF         PORTC+0, 2 
;coche_fantastico.c,33 :: 		PORTC.B5 = 1;
	BSF         PORTC+0, 5 
;coche_fantastico.c,35 :: 		DELAY_MS(500);
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
;coche_fantastico.c,36 :: 		PORTC.B2 = 0;
	BCF         PORTC+0, 2 
;coche_fantastico.c,37 :: 		PORTC.B5 = 0;
	BCF         PORTC+0, 5 
;coche_fantastico.c,38 :: 		PORTC.B1 = 1;
	BSF         PORTC+0, 1 
;coche_fantastico.c,39 :: 		PORTC.B6 = 1;
	BSF         PORTC+0, 6 
;coche_fantastico.c,41 :: 		DELAY_MS(500);
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
;coche_fantastico.c,42 :: 		PORTC.B1 = 0;
	BCF         PORTC+0, 1 
;coche_fantastico.c,43 :: 		PORTC.B6 = 0;
	BCF         PORTC+0, 6 
;coche_fantastico.c,44 :: 		PORTC.B0 = 1;
	BSF         PORTC+0, 0 
;coche_fantastico.c,45 :: 		PORTC.B7 = 1;
	BSF         PORTC+0, 7 
;coche_fantastico.c,47 :: 		}
	GOTO        L_main0
;coche_fantastico.c,48 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
