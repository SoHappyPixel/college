void main()
{
      short int led = 0;
      short int flag = 0;
      
      TRISB.B0= 0x01;
      TRISB.B1= 0;
      PORTB.B1= 0;

      INTCON2 = 0;

      while(1)
      {
       if(PORTB.B0==0) flag = 1;
       
       if(PORTB.B0==1 && flag == 1)
       {
        PORTB.B1 = ~PORTB.B1;
        flag=0;
       }
      delay_ms(100);
      }
}