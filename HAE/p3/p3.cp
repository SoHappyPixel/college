#line 1 "C:/Documents and Settings/Electrónica/Escritorio/Prácticas HAE 15-16/Viernes 12-30 a 14-30/p3/p3.c"
void main()
{
 int led = 0;
 int flag = 0;

 TRISB.B0= 0x01;
 TRISB.B1= 0;
 PORTB.B1= 0;

 INTCON2 = 0;

 while(1)
 {
 if(PORTB.B0==0) flag = 1;

 if(PORTB.B0==1 && flag == 1)
 {
 if(led == 1) led = 0;
 else led = 1;
 flag=0;
 }

 PORTB.B1 = led;

 }

}
