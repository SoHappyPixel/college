// Variables globales.
char x = 0;
char txt[14];
float time = 0;

// Pines activos LCD.
sbit LCD_RS at RC2_bit;
sbit LCD_EN at RC3_bit;
sbit LCD_D7 at RC7_bit;
sbit LCD_D6 at RC6_bit;
sbit LCD_D5 at RC5_bit;
sbit LCD_D4 at RC4_bit;

// Conexión pines LCD.
sbit LCD_RS_Direction at TRISC2_bit;
sbit LCD_EN_Direction at TRISC3_bit;
sbit LCD_D7_Direction at TRISC7_bit;
sbit LCD_D6_Direction at TRISC6_bit;
sbit LCD_D5_Direction at TRISC5_bit;
sbit LCD_D4_Direction at TRISC4_bit;

// Configurar timer.
void setTimer()
{
	//T0CON = 0xC3; // Pre = 8.
	//TMR0L = 6; // Mido 1ms.
    T0CON = 0xC8; // PSA = 1.
	TMR0L = 200; // Mido ?s.
}

// Mostrar por pantalla.
void outLcd()
{
	//FloatToStr(time,txt);
    FloatToStr(time*16570,txt);
	Lcd_Cmd(_LCD_CLEAR);
	Lcd_Out(1,1,txt);
}

// Activar el trigger.
void activeTrigger()
{
	PortD.b1=1;
	delay_us(10);
	PortD.b1=0;
}

// Manejo de interrupciones.
void interrupt()
{
	// Interrupción del timer.
	if(INTCON.TMR0IF==1)
	{
		time += 0.000001;
        setTimer();
		INTCON.TMR0IF=0 ;
	}
	// Interrupción si ECHO = high.
	if(INTCON.RBIF==1 && PortB.b4==1)
	{
		setTimer();
		x=PORTB;
		INTCON.RBIF=0;
	}
	// Interrupción si ECHO = low.
	if(INTCON.RBIF==1 && PortB.b4==0)
	{
		T0CON=0;
		x=PORTB;
		INTCON.RBIF=0;
		outLcd();
		delay_ms(1400);
		time = 0;
		activeTrigger();
        INTCON.RBIF=0;
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
	// Interrupciones en B low/high.
	INTCON2.RBPU=0;
	x=PORTB;
	INTCON.RBIF=0;
	INTCON.RBIE=1;
	// Interrupciones globales.
	INTCON.GIE = 1;
	// Pantalla LCD.
	Lcd_Init();
	// Activo el sonar.
	activeTrigger();
	// Evitar reinicios.
	while(1);
}