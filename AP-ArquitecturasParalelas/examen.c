#include <stdio.h>
#include <stdlib.h>

#include <opencv/cv.h>
#include <opencv/highgui.h>

#include <emmintrin.h>

#define NTHREADS 4

typedef __m128i m128i;

int main(int argc, char *argv[]) {
 
    int fila, col, trabajo, moveAux;
    IplImage *escenario, *copia;
    
    escenario = cvLoadImage(argv[2], -1);
    cvShowImage("meh.",escenario); cvWaitKey(0);    
    
    m128i *pCopia, frame;
    m128i tintR = _mm_set1_epi32(0x00FF0000);
    m128i tintG = _mm_set1_epi32(0x0000FF00);
    m128i tintB = _mm_set1_epi32(0x000000FF);
    
    //Roja
    copia = cvCloneImage(escenario);
    for(fila=0;fila<escenario->height;fila++){
        pCopia=(m128i*)(copia->imageData + fila * copia->widthStep);
        
        for(col=0;col<escenario->width;col+=4){
            frame= _mm_loadu_si128(pCopia);
            frame= _mm_and_si128(frame,tintR);
            _mm_storeu_si128(pCopia,frame); pCopia++;
            //cvShowImage("meh.",esc); cvWaitKey(1);
        }
    } cvShowImage("meh.",copia); cvWaitKey(0);
    
    //Verde.
    copia = cvCloneImage(escenario);
    for(fila=0;fila<escenario->height;fila++){
        pCopia=(m128i*)(copia->imageData + fila * copia->widthStep);
        
        for(col=0;col<escenario->width;col+=4){
            frame= _mm_loadu_si128(pCopia);
            frame= _mm_and_si128(frame,tintG);
            _mm_storeu_si128(pCopia,frame); pCopia++;
            //cvShowImage("meh.",esc); cvWaitKey(1);
        }
    } cvShowImage("meh.",copia); cvWaitKey(0);
    
    //Azul
    copia = cvCloneImage(escenario);
    for(fila=0;fila<escenario->height;fila++){
        pCopia=(m128i*)(copia->imageData + fila * copia->widthStep);
        
        for(col=0;col<escenario->width;col+=4){
            frame= _mm_loadu_si128(pCopia);
            frame= _mm_and_si128(frame,tintB);
            _mm_storeu_si128(pCopia,frame); pCopia++;
            //cvShowImage("meh.",esc); cvWaitKey(1);
        }
    } cvShowImage("meh.",copia); cvWaitKey(0);

    return EXIT_SUCCESS;

}
