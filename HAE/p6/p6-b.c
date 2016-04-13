// Global vars
char flag = 0;
short sec = 0;

void setTimer()
{
	PORTC = 1;
	T0CON = 0x84;
	TMR0H = (3036 >> 8); TMR0L = 3036;
}

// Manejo de interrupciones
void interrupt()
{
	if(INTCON.TMR0IF==1)
	{
		sec++;
		if(sec<60)
			setTimer();
		else
		{
			PORTC = 0;
			flag = 1;
		}
		INTCON.TMR0IF=0;
	}

	if(INTCON3.INT1IF==1)
	{
		if(flag==0) setTimer();
		INTCON3.INT1IF=0;
	}
}

void main()
{
	// Puertos
	TRISC = 0;
	TRISB = 0x02;

	// Datos
	PORTB = 0;
	PORTC = 0;

	// Timer
	INTCON.TMR0IF = 0;
	INTCON.TMR0IE = 1;

	// Interrupciones
	INTCON3.INT1IF = 0;
	INTCON3.INT1IE = 1;
	INTCON.GIE = 1;

	// Loop
	while(1);
}
