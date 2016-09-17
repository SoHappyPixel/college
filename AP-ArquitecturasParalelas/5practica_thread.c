#include <stdio.h>
#include <stdlib.h>
#include <opencv/cv.h>
#include <opencv/highgui.h>
#include <emmintrin.h>
#include <pthread.h>    /* POSIX Threads */
#include <semaphore.h>  /* Semaphore */


#define NTHREADS 4
IplImage *esc, *meko, *anim;
int trabajo,moveAux;
sem_t mutex; //Declaración global del semaforo.

void animacion_thread(void *ptr) {

    uchar *pMeko,*pAnim;
    int *filaIni = (int*) ptr;
    int i, fila, col;
    float alpha;
        
	for(fila=*filaIni;fila<48;fila+=NTHREADS){
        pMeko = (uchar*) meko->imageData + (fila+908) * meko->widthStep+780*4;
        pAnim = (uchar*) anim->imageData + fila * anim->widthStep+moveAux;
            
        for(col=0;col<56;col++){
            alpha=pMeko[3];
                
            for(i=0;i<4;i++){
                if(alpha!=0) *pAnim=*pMeko;
                pMeko++; pAnim++;
            }

            sem_wait(&mutex); /* down Mutex */
            
            int bucle;
            for (bucle = 0; bucle < 100; bucle++) trabajo++;

            sem_post(&mutex); /* up Mutex */
        }
    } moveAux+=64;
}

int main(int argc, char *argv[]) {
 	
    int cont, move, filaHilo[NTHREADS];

    esc = cvLoadImage(argv[2], -1);
    meko = cvLoadImage(argv[1], -1);
    
    for(move=0;move<3096;move+=64){
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
    }

    return EXIT_SUCCESS;
}