
_main:

;p3.c,1 :: 		void main()
;p3.c,3 :: 		int led = 0;
	CLRF        main_led_L0+0 
	CLRF        main_led_L0+1 
	CLRF        main_flag_L0+0 
	CLRF        main_flag_L0+1 
;p3.c,6 :: 		TRISB.B0= 0x01;
	BSF         TRISB+0, 0 
;p3.c,7 :: 		TRISB.B1= 0;
	BCF         TRISB+0, 1 
;p3.c,8 :: 		PORTB.B1= 0;
	BCF         PORTB+0, 1 
;p3.c,10 :: 		INTCON2 = 0;
	CLRF        INTCON2+0 
;p3.c,12 :: 		while(1)
L_main0:
;p3.c,14 :: 		if(PORTB.B0==0) flag = 1;
	BTFSC       PORTB+0, 0 
	GOTO        L_main2
	MOVLW       1
	MOVWF       main_flag_L0+0 
	MOVLW       0
	MOVWF       main_flag_L0+1 
L_main2:
;p3.c,16 :: 		if(PORTB.B0==1 && flag == 1)
	BTFSS       PORTB+0, 0 
	GOTO        L_main5
	MOVLW       0
	XORWF       main_flag_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main10
	MOVLW       1
	XORWF       main_flag_L0+0, 0 
L__main10:
	BTFSS       STATUS+0, 2 
	GOTO        L_main5
L__main8:
;p3.c,18 :: 		if(led == 1) led = 0;
	MOVLW       0
	XORWF       main_led_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main11
	MOVLW       1
	XORWF       main_led_L0+0, 0 
L__main11:
	BTFSS       STATUS+0, 2 
	GOTO        L_main6
	CLRF        main_led_L0+0 
	CLRF        main_led_L0+1 
	GOTO        L_main7
L_main6:
;p3.c,19 :: 		else led = 1;
	MOVLW       1
	MOVWF       main_led_L0+0 
	MOVLW       0
	MOVWF       main_led_L0+1 
L_main7:
;p3.c,20 :: 		flag=0;
	CLRF        main_flag_L0+0 
	CLRF        main_flag_L0+1 
;p3.c,21 :: 		}
L_main5:
;p3.c,23 :: 		PORTB.B1 = led;
	BTFSC       main_led_L0+0, 0 
	GOTO        L__main12
	BCF         PORTB+0, 1 
	GOTO        L__main13
L__main12:
	BSF         PORTB+0, 1 
L__main13:
;p3.c,25 :: 		}
	GOTO        L_main0
;p3.c,27 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
