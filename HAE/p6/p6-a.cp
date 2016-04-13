#line 1 "C:/Documents and Settings/Electrónica/Escritorio/Prácticas HAE 15-16/Viernes 12-30 a 14-30/p6/P6-a.c"
char flag=0;
void interrupt()
{
 portc.b0=~portc.b0;

 if(flag==0)
 {
 TMR0L = 81;
 T0CON = 0xC2;
 flag = ~flag;
 }
 else
 {
 TMR0L = 106;
 T0CON = 0xC1;
 flag = ~flag;
 }
 intcon.tmr0if=0;
}

void main()
{
 TRISC = 0;
 PORTC = 1;

 TMR0L = 106;
 T0CON = 0xC1;

 intcon.tmr0if=0;
 intcon.tmr0ie=1;
 intcon.gie=1;

 while(1);
}
