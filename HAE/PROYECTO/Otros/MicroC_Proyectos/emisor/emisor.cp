#line 1 "C:/Users/diego/Desktop/UNI/CURSO 2015-2016/TERCERO/HAE/p2-DANI/emisor/emisor.c"

char x = 0;
char flag = 0;


void interrupt()
{
 if(INTCON.RBIF == 1 )
 {
 x = PORTB;
 flag = ~flag;
 INTCON.RBIF = 0;


 if(flag)
 {
 T0CON = 0x90;
 TMR0H = 0;
 TMR0L = 0;
 }


 if(!flag)
 {
 T0CON = 0x10;
 UART1_Write(TMR0L);
 UART1_Write(TMR0H);
 }
 }
}



void main()
{

 TRISB = 0x10;
 TRISC = 0x00;
 PORTB = 0x00;
 PORTC = 0x00;


 x = PORTB;
 INTCON.RBIF = 0;
 INTCON.RBIE = 1;


 INTCON.TMR0IF = 0;
 INTCON.TMR0IE = 1;


 RCON.IPEN = 0;
 INTCON.PEIE = 0;
 INTCON.GIE = 1;


 T0CON = 0x10;
 TMR0H = 0;
 TMR0L = 0;


 UART1_Init(9600);
 delay_ms(300);


 while(1)
 {
 PORTB.B0 = 1;
 delay_us(10);
 PORTB.B0 = 0;
 delay_ms(1500);
 }
}
