#line 1 "C:/Documents and Settings/Electrónica/Escritorio/Prácticas HAE 15-16/Viernes 12-30 a 14-30/p2/p2.c"
void main()
{
 int i=0;
 short int TENS = 0;
 short int UNITS = 0;
 char hex[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x67};

 TRISA = 0;
 TRISD = 0;
 PORTA = 0;
 PORTD = 0;

 while(1)
 {
 for(i=0; i<50; i++)
 {
 PORTD = hex[UNITS];
 PORTA = 0x01;

 DELAY_MS(10);
 PORTA = 0;
 PORTD = hex[TENS];
 PORTA = 0x02;
 DELAY_MS(10);
 PORTA = 0;
 }

 UNITS++;

 if(UNITS == 10)
 {
 UNITS = 0;
 TENS++;

 if(TENS == 6) TENS = 0;
 }
 }

}
