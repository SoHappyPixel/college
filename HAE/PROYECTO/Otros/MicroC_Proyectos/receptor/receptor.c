// Variables globales.
float input;
char output[14];


// Salidas LCD.
sbit LCD_RS at RC0_bit;
sbit LCD_EN at RC1_bit;
sbit LCD_D7 at RB7_bit;
sbit LCD_D6 at RB6_bit;
sbit LCD_D5 at RB5_bit;
sbit LCD_D4 at RB4_bit;

// Patillas LCD.
sbit LCD_RS_Direction at TRISC0_bit;
sbit LCD_EN_Direction at TRISC1_bit;
sbit LCD_D7_Direction at TRISB7_bit;
sbit LCD_D6_Direction at TRISB6_bit;
sbit LCD_D5_Direction at TRISB5_bit;
sbit LCD_D4_Direction at TRISB4_bit;

// Manejo de interrupciones.
void interrupt()
{
                if(PIR1.RCIF == 1)
                {
                                input = UART1_Read();
                                delay_ms(50);
                                input = input + (UART1_Read() << 8); // Se caputra el valor bajo timer.
                                FloatToStr(input*(1.6570e-2),output); // Se captura el valor alto del timer.
                                Lcd_Cmd(_LCD_CLEAR); // Se limpia lo que mueste la pantalla.
                                LCD_out(1,1,output); // Se imprime la distancia en pantalla.
                }
                PIR1.RCIF = 0; // Se apaga la interrupción del UART. 
}

// Ejecución principal del programa.
void main()
{
                // Puertos y datos !
                TRISC.B7 = 1;
                PORTC.B7 = 0;
                
                // Interrupciones !
                RCON.IPEN = 0;
                PIR1.RCIF = 0;
                PIE1.RCIE = 1;
                INTCON.PEIE = 1;
                INTCON.GIE = 1;

                // Iniciamos la pantalla !
                Lcd_Init();

                // Módulo UART !
                UART1_Init(9600);
                delay_ms(300);

                // Evitar reinicios !
                while(1) {}
}