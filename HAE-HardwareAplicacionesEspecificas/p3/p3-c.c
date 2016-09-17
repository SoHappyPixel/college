short int UNITS = 0, TENS = 0;

void interrupt()
{
        INTCON.INT0IF = 0;
        UNITS++;
        if(UNITS == 10)
        {
                UNITS = 0; TENS++;
                if(TENS == 10) TENS = 0;
        }
}

void main() {
     char hex[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x67};

     TRISC = 0;
     TRISD = 0;
     TRISB.B0 = 1;

     PORTC = 0;
     PORTD = 0;
     PORTB.B0 = 0;

     INTCON2 = 0;
     INTCON.INT0IF = 0;
     INTCON.INT0IE = 1;
     INTCON.GIE = 1;

      while(1)
      {
        PORTD = 0xFD;
        PORTC = hex[UNITS];
        DELAY_MS(24);

        PORTD = 0xFE;
        PORTC = hex[TENS];
        DELAY_MS(24);
      }
}