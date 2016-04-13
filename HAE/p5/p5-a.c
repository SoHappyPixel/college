#include "Tecla12INT.h"
char x = 0, key = 0;

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


void interrupt() //se ha pulsado una tecla
{
key=tecla();
Lcd_chr(1,1,key);
x=PORTB;
INTCON.RBIF=0;
}


void main()
{

TRISB=0xF0;
PORTB=0;

//Configuracion interrupcion RB4-RB7
INTCON2.RBPU=0; //se habilitan las resistencias de pullup de las entradas del PORTB
x=PORTB;//para poder borrar el RBIF
INTCON.RBIF=0;
INTCON.RBIE=1;
INTCON.GIE=1;

Lcd_Init ();

}