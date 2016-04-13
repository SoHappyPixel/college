char x=0, txt[4];
unsigned short cont=90;

// Lcd pinout settings
sbit LCD_RS at RD2_bit;
sbit LCD_EN at RD3_bit;
sbit LCD_D7 at RD7_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D4 at RD4_bit;
// Pin direction
sbit LCD_RS_Direction at TRISD2_bit;
sbit LCD_EN_Direction at TRISD3_bit;
sbit LCD_D7_Direction at TRISD7_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D4_Direction at TRISD4_bit;

void interrupt()
{
  if(portb.b4==0)
  {
    cont++;
    if(cont==100) cont = 0;
    ByteToStr(cont,txt);
    Lcd_out(1,1,txt);
  }
  x=PORTB;
  INTCON.RBIF=0;
}

void main()
{
  TRISB=0xF0;
  PORTB=0;
  INTCON2.RBPU=0;
  x=PORTB;
  INTCON.RBIF=0;
  INTCON.RBIE=1;
  INTCON.GIE=1;

  Lcd_Init();
  while(1);
}