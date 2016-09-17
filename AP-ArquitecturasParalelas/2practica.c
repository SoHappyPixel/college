#include <stdio.h>
#include <stdlib.h>
#include <opencv/cv.h>
#include <opencv/highgui.h>

int main(int argc, char** argv) {

    if (argc != 3) {
        printf("Usage: %s image_file_name\n", argv[0]);
        return EXIT_FAILURE;
    }

    IplImage* ImgIni = cvLoadImage(argv[1], CV_LOAD_IMAGE_UNCHANGED);
    IplImage* ImgFin = cvLoadImage(argv[2], CV_LOAD_IMAGE_UNCHANGED);
    IplImage* ImgTran = cvCreateImage(cvGetSize(ImgIni),IPL_DEPTH_8U, 3);

    if (!ImgIni && !ImgFin) {
        printf("Error: fichero %s no leido\n", argv[1]);
        return EXIT_FAILURE;
    }

    int fila,col;
    int alfa;
    uchar *pTran;
    uchar *pIni;
    uchar *pFin;

    cvNamedWindow("Trans", 1);
    
    for(alfa=255; alfa>=0; alfa-=15){
        for(fila = 0; fila<ImgTran->height; fila++){
            pTran = (uchar*) ImgTran->imageData + ImgTran->widthStep*fila;
            pFin = (uchar*) ImgIni->imageData + ImgIni->widthStep*fila;
            pIni = (uchar*) ImgFin->imageData + ImgFin->widthStep*fila;

            for(col = 0; col<ImgTran->width; col++){
                *pTran =  (uchar) (*pIni * alfa/255 + *pFin - (*pFin * alfa/255));
                pTran++; pIni++; pFin++;
                *pTran =  (uchar) (*pIni * alfa/255 + *pFin - (*pFin * alfa/255));
                pTran++; pIni++; pFin++;
                *pTran =  (uchar) (*pIni * alfa/255 + *pFin - (*pFin * alfa/255));
                pTran++; pIni++; pFin++;
            }
        }
        cvShowImage("Trans", ImgTran);
        cvWaitKey(1);
    }

    cvWaitKey(0);
    cvReleaseImage(&ImgTran);
    cvDestroyWindow("Trans");

    return EXIT_SUCCESS;
}