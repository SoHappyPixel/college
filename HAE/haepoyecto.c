// Variables globales.
char x = 0;
char txt[14];
float time = 0;
float dist = 0;
char flagTrigger = 0;
/*char flagEcho = 0;*/

// Conexiones pantalla LCD.
sbit LCD_RS at RC2_bit;
sbit LCD_EN at RC3_bit;
sbit LCD_D7 at RC7_bit;
sbit LCD_D6 at RC6_bit;
sbit LCD_D5 at RC5_bit;
sbit LCD_D4 at RC4_bit;
sbit LCD_RS_Direction at TRISC2_bit;
sbit LCD_EN_Direction at TRISC3_bit;
sbit LCD_D7_Direction at TRISC7_bit;
sbit LCD_D6_Direction at TRISC6_bit;
sbit LCD_D5_Direction at TRISC5_bit;
sbit LCD_D4_Direction at TRISC4_bit;

// Configurar timer.
void setTimer()
{
    T0CON = 0xC3;
    TMR0L = 6;
}

// Mostrar por pantalla.
void outLcd()
{
	dist = time/1000 * 16570;
	Lcd_Cmd(_LCD_CLEAR);
	FloatToStr(dist,txt);
	Lcd_Out(1,1,txt);
}

// Manejo de interrupciones.
void interrupt()
{
    // Interrupción del timer.
	if(INTCON.TMR0IF==1)
	{
		time = time +1; setTimer();
		INTCON.TMR0IF=0 ;
	}
    // Interrupción si ECHO = high.
	if(INTCON.RBIF==1 && PortB.b4==1)
	{
		/*flagEcho=1;*/
        setTimer();
        x=PORTB;
        INTCON.RBIF=0;
	}
    // Interrupción si ECHO = low.
	if(INTCON.RBIF==1 && PortB.b4==0 /*&& flagEcho ==1*/)
	{
		/*flagEcho=0;*/
        T0CON=0;
        x=PORTB;
        INTCON.RBIF=0;
        outLcd();
        delay_ms(1400);
        time = 0;
        flagTrigger = 0;
	}
}

// Ejecución principal.
void main()
{
    // Puertos y datos.
	TRISB = 0xFF; PORTB = 0;
	TRISC = 0x00; PORTC = 0;
	TRISD = 0x00; PORTD = 0;
    // Timer
	INTCON.TMR0IF = 0;
	INTCON.TMR0IE = 1;
    // Interrupciones en B up/down.
    INTCON2.RBPU=0;
    x=PORTB;
    INTCON.RBIF=0;
    INTCON.RBIE=1;
    // Interrupciones globales.
	INTCON.GIE = 1;
    // Pantalla LCD.
	Lcd_Init();
	/ /Ejecución continua.
    while(1)
	{
        // Si no hay bandera, activa el trigger.
		if(flagTrigger==0)
		{
			PortD.b1=1;
            delay_us(10);
			PortD.b1=0;
            flagTrigger=1;
		}
        else asm nop;
	}
}