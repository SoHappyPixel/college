#include <opencv2/highgui/highgui_c.h>
#include <opencv2/core/core_c.h>
#include <emmintrin.h>
#include <pthread.h> 
#include <stdio.h>

#define NTHREADS 4
typedef __m128i m128i;

CvCapture *capture;
IplImage *frame,*bug;
/* ELMINADAS CABECERAS DE LAS FUNCIONES */

int main(int argc, char** argv){
    /* FALTA CONTROL DE ERRORES. */
    capture = cvCaptureFromFile(argv[2]);
    frame = cvQueryFrame(capture);
    bug  = cvLoadImage(argv[1], 1);

    int MAX = frame->height * frame->width * 255 * 3;

    while(frame){
        
        int fM=0, cM=0, difM=MAX;
        cvBuscar(frame,bug,&fM,&cM,&difM);
        cvPintar(frame,fM,cM);
        cvShowImage("Frame",frame); cvWaitKey(1);
        printf("Diferencia Menor: %d\nF:%d - C:%d\n\n",difM,fM,cM);
        frame = cvQueryFrame(capture);

        //------------_

/*  PROXIMAMENTE HILOS...

        anim = cvCloneImage(esc);

        trabajo = 0;
        pthread_t threads[NTHREADS];

        sem_init(&mutex, 0, 1);

        for(cont = 0; cont < NTHREADS; cont++){
            filaHilo[cont] = cont;
            pthread_create(&threads[cont], NULL, (void *) &animacion_thread, (void *) &filaHilo[cont]);
        }for(cont = 0; cont < NTHREADS; cont++) pthread_join(threads[cont], NULL);

        sem_destroy(&mutex);

        //printf("\nSe han procesado %d pixels.", trabajo);
        cvShowImage("frameTHREADS", anim); cvWaitKey(1);                    
*/


    }
    
    return EXIT_SUCCESS;}

void cvBuscar(const IplImage *frame, const IplImage *bug, int *filaLocalizada, int *colLocalizada, int *gtDif){
    /* SMID + THREADS */
    //int *filaIni = (int*) ptr; //Fila del hilo.
    int filaAux, filaEnv, colEnv, filaBug, colBug;

    m128i *pBug, *pEnv;

    m128i frame, bug, mascara, difColor;
    m128i alfa = _mm_set1_epi32(0xFF000000);
    
    m128i zero;
    zero= _mm_xor_si128(zero,zero); 

    /* SMID, sin Threads */
    for(filaEnv=190; filaEnv < 260; filaEnv++){

        for(colEnv=700; colEnv< 1000; colEnv++){

            for(filaBug=(*filaIni)+filaEnv; filaBug< (*filaIni)+filaEnv+48; filaBug++){
                pBug= (m128i *)
                frame->imageData + filaBug * frame->widthStep + colEnv;
                pEnv= (m128i *)
                bug->imageData + filaAux * bug->widthStep; filaAux++;

                 for(colBug=0; colBug<48; colBug++){
                        //Máscara mariquita.
                        bug= _mm_loadu_si128(pBug);
                        mascara= _mm_and_si128(bug,alfa);
                        mascara= _mm_cmpeq_epi32(mascara,zero);
                        bug= _mm_andnot_si128(mascara,bug);

                        //Algo con el fondo.
                        frame= _mm_loadu_si128(pEnv);
                        frame= _mm_and_si128(mascara,frame);
                        frame= _mm_or_si128(bug,frame);

                        //Cálculo de la diferencia.
                        difColor= _mm_and_si128(difColor,_mm_sad_epu8(frame,bug));

                        //Incremento de punteros.
                        pEnv++; pBug++;
                    }
                }

            if((int)difColor < (*gtDif)){
                (*gtDif)= (int)difColor;
                filaLocalizada= filaEnv;
                colLocalizada= colaEnv;
            }difColor=zero; //Reseteo valor diferencia.
            filaAux=0; //Reseteo la fila de la búsqueda.
        }
    }
}

/* PINTAR: */
// m128i blanco = _mm_set1_epi32(0x55FFFFFF);
// _mm_storeu_si128(pEnv,blanco);

void cvPintar(IplImage* frame, const int filaLocalizada, const int colLocalizada){
    
    m128i *pintar;
    int horiz, vert;
    
    for (int horiz=filaLocalizada; horiz < filaLocalizada+1; horiz++){
        for(int vert=colLocalizada; vert < colLocalizada+1; vert++){
            m128i blanco = _mm_set1_epi32(0x55FFFFFF);
            _mm_storeu_si128(pintar,blanco);
        }
    }
}