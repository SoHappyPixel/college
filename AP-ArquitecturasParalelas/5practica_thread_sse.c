#include <stdio.h>
#include <stdlib.h>

#include <opencv/cv.h>
#include <opencv/highgui.h>

#include <emmintrin.h>
#include <pthread.h>

#define NTHREADS 4

typedef __m128i m128i;

int moveAux;
IplImage *esc, *meko, *anim;

void animacion_thread(void *ptr){
    
    m128i *pMeko, *pAnim;
    m128i frame, pj, mascara;
    m128i alfa = _mm_set1_epi32(0xFF000000);
    m128i ceros; ceros = _mm_xor_si128(ceros,ceros);
    
    int *filaIni = (int*) ptr, i, fila, col;

    for(fila=*filaIni;fila<48;fila+=NTHREADS){
        pMeko=(m128i*)(meko->imageData + (fila+908) * meko->widthStep +780*4);
        pAnim=(m128i*)(anim->imageData + fila * anim->widthStep+moveAux);
        
        for(col=0;col<52;col++){
            pj= _mm_loadu_si128(pMeko);
            mascara= _mm_and_si128(pj,alfa);
            mascara= _mm_cmpeq_epi32(mascara,ceros);
            pj= _mm_andnot_si128(mascara,pj);

            frame= _mm_loadu_si128(pAnim);
            frame= _mm_and_si128(mascara,frame);
            frame= _mm_or_si128(pj,frame);

            _mm_storeu_si128(pAnim,frame);
            pMeko++; pAnim++;
            
        }
    } moveAux+=4;
}

int main(int argc, char *argv[]) {
 	
    int cont, move, filaHilo[NTHREADS];
    esc = cvLoadImage(argv[2], -1);
    meko = cvLoadImage(argv[1], -1);
    
    for(move=0;move<esc->width;move++){
        anim = cvCloneImage(esc);
        pthread_t threads[NTHREADS];
        
        for(cont=0; cont < NTHREADS; cont++) filaHilo[cont] = cont;
        for(cont = 0; cont < NTHREADS; cont++) pthread_create(&threads[cont], NULL, (void *) &animacion_thread, (void *) &filaHilo[cont]);
        for(cont = 0; cont < NTHREADS; cont++) pthread_join(threads[cont], NULL);
        
        cvShowImage("frameTHREADS", anim); cvWaitKey(1);
    } return EXIT_SUCCESS;

}
