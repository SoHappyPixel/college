#line 1 "C:/Documents and Settings/Electrónica/Escritorio/Prácticas HAE 15-16/Viernes 12-30 a 14-30/p1/LedsAutopista.c"
void main() {
 TRISC = 0x00;
 PORTC = 0x00;


 while(1) {

 PORTC.B0 = 1;
 DELAY_MS(500);
 PORTC.B0 = 0;
 PORTC.B1 = 1;
 DELAY_MS(500);
 PORTC.B1 = 0;
 PORTC.B2 = 1;
 DELAY_MS(500);
 PORTC.B2 = 0;
 PORTC.B3 = 1;
 DELAY_MS(500);
 PORTC.B3 = 0;
 PORTC.B4 = 1;
 DELAY_MS(500);
 PORTC.B4 = 0;
 PORTC.B5 = 1;
 DELAY_MS(500);
 PORTC.B5 = 0;
 PORTC.B6 = 1;
 DELAY_MS(500);
 PORTC.B6 = 0;
 PORTC.B7 = 1;
 DELAY_MS(500);
 PORTC.B7 = 0;

 }
}
