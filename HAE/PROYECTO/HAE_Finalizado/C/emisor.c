// Variables globales.
char x = 0;
char flag = 0;

// Manejo de interrupciones.
void interrupt()
{
        if(INTCON.RBIF == 1 )
        {
                x = PORTB; // RBIF exige antes leer PORTB.
                flag = ~flag; // Control entrada low/high.
                INTCON.RBIF = 0; // Se apaga la interrupción.
                
                // ECHO a nivel alto !
                if(flag)
                {
                        T0CON = 0x90; // Se enciende el timer.
                        TMR0H = 0; // Valor high para el alfa del timer.
                        TMR0L = 0; // Valor low para el alfa del timer.
                }
                
                // ECHO a nivel bajo ! 
                if(!flag)
                {  
                        T0CON = 0x10; // Se apaga el timer.
                        UART1_Write(TMR0L); // Envio TMR0L via UART.
                        UART1_Write(TMR0H); // Envio TMR0H via UART.
                }
        }
}

// Ejecución principal del programa.
// El timer se incrementa en 'high-to-low' para mayor precisión.
void main()
{ 
        // Puertos y datos !
        TRISB = 0x10; // (I)ECHO->rb4 : (O)TRIGGER->rb0.
        TRISC = 0x00; // Pines de C como Output.
        PORTB = 0x00; // Datos en B a 0.
        PORTC = 0x00; // Datos en C a 0.

        // Interrupción para ECHO !
        x = PORTB; // RBIF exige antes leer PORTB.
        INTCON.RBIF = 0; // Flag de activación apagado.
        INTCON.RBIE = 1; // Interrupciones en B a low/high.

        // Interrupciones Timer !
        INTCON.TMR0IF = 0; // Flag de activación apagado.
        INTCON.TMR0IE = 1; // Se permite que el timer lance interrupciones.

        // Interrupciones !
        RCON.IPEN = 0; // Sin prioridad.
        INTCON.PEIE = 0; // Tipo core.
        INTCON.GIE = 1; // Interrupciones globales.

        // Configuración Timer !
        T0CON = 0x10; // Se apaga el timer.
        TMR0H = 0; // Valor high para el alfa del timer.
        TMR0L = 0; // Valor low para el alfa del timer.
        
        // Módulo UART !
        UART1_Init(9600);
        delay_ms(300); 

        // Intervalos de activación del TRIGGER !
        while(1)
        {
                PORTB.B0 = 1;
                delay_us(10);
                PORTB.B0 = 0;
                delay_ms(1500);
        }
}