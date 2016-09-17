#include <stdio.h>
#include <stdlib.h>
#include <opencv/cv.h>
#include <emmintrin.h>
#include <opencv/highgui.h>

typedef __m128i m128i;

int main(int argc, char** argv) {

    if (argc != 3) {
        printf("Usage: %s image_file_name\n", argv[0]);
        return EXIT_FAILURE;
    }

    IplImage* ImgIni = cvLoadImage(argv[1], CV_LOAD_IMAGE_UNCHANGED);
    IplImage* ImgFin = cvLoadImage(argv[2], CV_LOAD_IMAGE_UNCHANGED);
    IplImage* ImgTran = cvClone(ImgIni);

    if (!ImgIni && !ImgFin) {
        printf("Error: fichero %s no leido\n", argv[1]);
        return EXIT_FAILURE;
    }

    /*int fila,col,i;
    uchar *pTran, *pIni, *pFin;
    cvShowImage("Trans", ImgTran); cvWaitKey(0);
    
    for(i=0;i<256;i++){
        for(fila = 0; fila<ImgTran->height; fila++){
            pTran = (uchar*) ImgTran->imageData + ImgTran->widthStep*fila;
            pFin = (uchar*) ImgFin->imageData + ImgFin->widthStep*fila;

            for(col = 0; col<ImgTran->width; col++){
                if(*pTran>0)
                    *pTran= *pTran-1;
                 pTran++;
                if(*pTran>0)
                    *pTran= *pTran-1;
                 pTran++;
                if(*pTran>0)
                    *pTran= *pTran-1;
                 pTran++;
            }
        }
        cvShowImage("Trans", ImgTran);
        cvWaitKey(5);
    }
    cvWaitKey(0);
    
    for(i=0;i<256;i++){
        for(fila = 0; fila<ImgTran->height; fila++){
            pTran = (uchar*) ImgTran->imageData + ImgTran->widthStep*fila;
            pFin = (uchar*) ImgFin->imageData + ImgFin->widthStep*fila;

            for(col = 0; col<ImgTran->width; col++){
                if(*pTran<*pFin)
                    *pTran= *pTran+1;
                 pTran++; pFin++;
                if(*pTran<*pFin)
                    *pTran= *pTran+1;
                 pTran++; pFin++;
                if(*pTran<*pFin)
                    *pTran= *pTran+1;
                 pTran++; pFin++;
            }
        }
        cvShowImage("Trans", ImgTran);
        cvWaitKey(5);
    }
    cvWaitKey(0);*/

    //Con SSE2
    int avance,cont;
    m128i *pImg,iT16;
    m128i unos=_mm_set1_epi8((uchar) 1);
    cvShowImage("Trans", ImgTran); cvWaitKey(0);
    
    for(cont=0;cont<256;cont++){
        pImg = (m128i*) ImgTran->imageData;

        for(avance=0;avance<ImgTran->imageSize;avance+=16){
            iT16=*pImg;
            iT16=_mm_subs_epu8(iT16,unos);
            *pImg++=iT16;
        }
        cvShowImage("Trans", ImgTran); cvWaitKey(1);
    }

    m128i *pAux, aux;
    for(cont=0;cont<256;cont++){
        pImg = (m128i*) ImgTran->imageData;
        pAux = (m128i*) ImgFin->imageData;

        for(avance=0;avance<ImgTran->imageSize;avance+=16){
            aux=*pAux;
            iT16=*pImg;
            iT16=_mm_min_epu8(aux,iT16);
            iT16=_mm_adds_epu8(iT16,unos);
            *pImg++=iT16;
            pAux++;
        }
        cvShowImage("Trans", ImgTran); cvWaitKey(1);
    }    
    
    
    return EXIT_SUCCESS;
}