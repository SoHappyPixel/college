void main() {
     TRISC = 0x00;
     PORTC = 0x00;


     while(1) {
              
              PORTC.B0 = 1;
              PORTC.B7 = 1;
              
              DELAY_MS(500);
              PORTC.B0 = 0;
              PORTC.B7 = 0;
              PORTC.B1 = 1;
              PORTC.B6 = 1;
              
              DELAY_MS(500);
              PORTC.B1 = 0;
              PORTC.B6 = 0;
              PORTC.B2 = 1;
              PORTC.B5 = 1;
              
              DELAY_MS(500);
              PORTC.B2 = 0;
              PORTC.B5 = 0;
              PORTC.B3 = 1;
              PORTC.B4 = 1;
              
              DELAY_MS(500);
              PORTC.B3 = 0;
              PORTC.B4 = 0;
              PORTC.B2 = 1;
              PORTC.B5 = 1;
              
              DELAY_MS(500);
              PORTC.B2 = 0;
              PORTC.B5 = 0;
              PORTC.B1 = 1;
              PORTC.B6 = 1;
              
              DELAY_MS(500);
              PORTC.B1 = 0;
              PORTC.B6 = 0;
              PORTC.B0 = 1;
              PORTC.B7 = 1;

     }
}