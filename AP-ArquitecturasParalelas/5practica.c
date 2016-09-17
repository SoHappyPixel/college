#include <stdio.h>
#include <opencv/cv.h>
#include <opencv/highgui.h>

typedef __m128i m128i;

int main(int argc, char** argv) {
    
    //VERSIÓN IF-ELSE.
    /*IplImage* esc = cvLoadImage(argv[2], -1);
    IplImage* meko = cvLoadImage(argv[1], -1);
    IplImage* copia = cvCloneImage(esc);
    
    //int ini = (esc->height - meko->height); //Por si no lo quieres arriba.
    int fin = (esc->widthStep*3);
    int filaAux=908, colAux=780,fila,col,move,i;
    uchar *pMeko,*pCop,alpha;
    
    for (move=0; move < fin; move+=63){
        cvShowImage("Angry", copia); cvWaitKey(1);
        copia=cvCloneImage(esc);
        
        for(fila=0;fila<48;fila++){
            pMeko = (uchar*) meko->imageData + (fila+filaAux) * meko->widthStep+colAux*4;
            pCop = (uchar*) copia->imageData + fila * copia->widthStep+move;
            
            for(col=0;col<56;col++){
                alpha=pMeko[3];
                
                for(i=0;i<4;i++){
                    if(alpha!=0) *pCop=*pMeko;
                    pMeko++; pCop++;
                }
            }
        }
    } cvWaitKey(0);*/
    
    int fila,col,move,ff;
    IplImage* esc = cvLoadImage(argv[2], -1);
    
    
    m128i *pMeko,*pAnim;
    IplImage* meko = cvLoadImage(argv[1], -1);
    IplImage* anim = cvCloneImage(esc);
    
    m128i frame, pj, mascara;
    m128i alfa = _mm_set1_epi32(0xFF000000);
    
    m128i ceros;
    ceros= _mm_xor_si128(ceros,ceros);
    
    for (move=0; move < 3096*10000; move+=3095){
        cvShowImage("Angry", anim); cvWaitKey(3);
        anim = cvCloneImage(esc);
        for (fila=0; fila < 48; fila++){
            pMeko=(m128i*)(meko->imageData + (fila+908) * meko->widthStep +780*4);
            pAnim=(m128i*)(anim->imageData + fila * anim->widthStep+move);

            for(col=0;col<56;col+=4){
                pj= _mm_loadu_si128(pMeko);
                mascara= _mm_and_si128(pj,alfa);
                mascara= _mm_cmpeq_epi32(mascara,ceros);
                pj= _mm_andnot_si128(mascara,pj);

                frame= _mm_loadu_si128(pAnim);
                frame= _mm_and_si128(mascara,frame);
                frame= _mm_or_si128(pj,frame);

                _mm_storeu_si128(pAnim,frame);
                pMeko++;pAnim++;
            }
        } 
    }
    return EXIT_SUCCESS;
}