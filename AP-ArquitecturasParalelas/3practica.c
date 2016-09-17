#include <stdio.h>
#include <opencv/cv.h>
#include <opencv/highgui.h>

int main(int argc, char** argv) {
    
    //Cargo imagen escenario :D
    IplImage* escenario = cvLoadImage(argv[1], -1);
    //Cargo imagen sumo :D
    IplImage* sumo = cvLoadImage(argv[2], -1);
    //Imprescindible copia de escenario :D
    IplImage* copia = cvCloneImage(escenario);
    
    //Variables de control :D
    int filaAux, move, fila, col;
    //Fila donde empezamos :D
    int R = (escenario->height - sumo->height);
    //Columna donde acabamos D:
    int C = (escenario->widthStep - sumo->widthStep);
    
    for (move=0; move < C; move+=3){
        //Muestra escenario y ya D:
        cvShowImage("Escenario", copia); cvWaitKey(1);
        //Reiniciamos variables D:
        filaAux = R; copia=cvCloneImage(escenario);
        
        for (fila = 0; fila < sumo->height; fila++){
            //Puntero de escenario.
            unsigned char *pE = (unsigned char*) copia->imageData + filaAux * copia->widthStep + move;
            //Puntero del sumo.
            unsigned char *pS = (unsigned char*) sumo->imageData + fila * sumo->widthStep;
            //Incremento de la fila auxiliar
            filaAux++;

            //Ahora la máscara pero ocupando mucho menos código :D
            for (col = 0; col < sumo->width; col++){
                //Sí el pixel es negro no lo printo D: e incremento los ptr :D
                if (*pS==0x00 && *(pS+1)==0x00 && *(pS+2)==0x00) {pE+=3; pS+=3;}
                //Si es cualquier otro color, sí que lo printo :D
                else{ 
                    *pE++ = *pS++;
                    *pE++ = *pS++;
                    *pE++ = *pS++;}}}} 

    //Espero tecla :O
    cvWaitKey(0); return EXIT_SUCCESS;
}