char flag = 0;

void interrupt()
{
     INTCON.INT0IF = 0;
     
     if(flag == 0)
     {
      PORTC = 0x0C;
      delay_ms(100);
      PORTC = 0x09;
      delay_ms(100);
      PORTC = 0x03;
      flag = 1;
     }

     else
     {
      PORTC = 0x09;
      delay_ms(100);
      PORTC = 0x0C;
      delay_ms(100);
      PORTC = 0x06;
      delay_ms(100);
      PORTC = 0x03;
      delay_ms(100);
      PORTC = 0x09;
      delay_ms(100);
      PORTC = 0x0C;
      delay_ms(100);
      PORTC = 0x06;
      delay_ms(100);
      PORTC = 0x03;
     }
}

void main()
{
     TRISB=1;
     TRISC=0;

     PORTC = 0x01;
     PORTC = 0x02;
     PORTC = 0x06;
     
     INTCON.INT0IF = 0;
     INTCON.INT0IE = 1;
     INTCON.GIE = 1;

     while(1);

}