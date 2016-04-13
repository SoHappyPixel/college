char flag=0;
void interrupt()
{
  portc.b0=~portc.b0;

  if(flag==0)
  {
    T0CON = 0xC2;
    TMR0L = 81;
    flag = ~flag;
  }
  else
  {
    T0CON = 0xC1;
    TMR0L = 106;
    flag = ~flag;
  }
  intcon.tmr0if=0;
}

void main()
{
  TRISC = 0;
  PORTC = 1;

  T0CON = 0xC1;
  TMR0L = 106;

  intcon.tmr0if=0;
  intcon.tmr0ie=1;
  intcon.gie=1;

  while(1);
}