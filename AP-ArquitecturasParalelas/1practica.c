#include <stdio.h>
#include <stdlib.h>
#include <opencv/cv.h>
#include <opencv/highgui.h>

int main(int argc, char** argv) {
    if (argc > 5) {printf("Usage: %s image_file_name\n", argv[0]); return EXIT_FAILURE;}
    
    IplImage* Img1 = cvLoadImage(argv[1], CV_LOAD_IMAGE_UNCHANGED);
    if (!Img1) {printf("Error: fichero %s no leido\n", argv[1]); return EXIT_FAILURE;}
        
    cvNamedWindow(argv[1], 1);
    cvShowImage(argv[1], Img1); cvWaitKey(0);
    cvDestroyWindow(argv[1]);
    
    uchar *pImg;
    
    IplImage* ImgBLUE = cvCreateImage(cvGetSize(Img1), IPL_DEPTH_8U, 3);
    uchar *pImgBLUE;
    int filaB, columnaB;
    
    for (filaB = 0; filaB < Img1->height; filaB++){
        pImg = (uchar *) Img1->imageData + filaB * Img1->widthStep;
        pImgBLUE = (uchar *) ImgBLUE->imageData + filaB * ImgBLUE->widthStep;
    
        for (columnaB = 0; columnaB < Img1->width; columnaB++){
            *pImgBLUE++ =   *pImg++;
            *pImgBLUE++ = 0; pImg++;
            *pImgBLUE++ = 0; pImg++;}}
    
    cvNamedWindow("Frutas Azules", 1);
    cvShowImage("Frutas Azules", ImgBLUE); cvWaitKey(0);
    cvDestroyWindow("Frutas Azules");
    
    IplImage* ImgGREEN = cvCreateImage(cvGetSize(Img1), IPL_DEPTH_8U, 3);
    uchar *pImgGREEN;
    int filaG, columnaG;
    
    for (filaG = 0; filaG < Img1->height; filaG++){
        pImg = (uchar *) Img1->imageData + filaG * Img1->widthStep;
        pImgGREEN = (uchar *) ImgGREEN->imageData + filaG * ImgGREEN->widthStep;
    
        for (columnaG = 0; columnaG < Img1->width; columnaG++){
            *pImgGREEN++ = 0; pImg++;
            *pImgGREEN++ =   *pImg++;
            *pImgGREEN++ = 0; pImg++;}}
    
    cvNamedWindow("Frutas Verdes", 1);
    cvShowImage("Frutas Verdes", ImgGREEN); cvWaitKey(0);
    cvDestroyWindow("Frutas Verdes");
    
    
    IplImage* ImgRED = cvCreateImage(cvGetSize(Img1), IPL_DEPTH_8U, 3);
    uchar *pImgRED;
    int filaR, columnaR;
    
    for (filaR = 0; filaR < Img1->height; filaR++) {
        pImg = (uchar *) Img1->imageData + filaR * Img1->widthStep;
        pImgRED = (uchar *) ImgRED->imageData + filaR * ImgRED->widthStep;
    
        for (columnaR = 0; columnaR < Img1->width; columnaR++) {
            *pImgRED++ = 0; pImg++;
            *pImgRED++ = 0; pImg++;
            *pImgRED++ =   *pImg++;}}
    
    cvNamedWindow("Frutas Rojas", 1);
    cvShowImage("Frutas Rojas", ImgRED); cvWaitKey(0);
    cvDestroyWindow("Frutas Rojas");
    
    IplImage* ImgGRAY = cvCreateImage(cvGetSize(Img1), IPL_DEPTH_8U, 3);
    uchar *pImgGRAY;
    int filaW, columnaW;

    for (filaW = 0; filaW < Img1->height; filaW++) {
        pImg = (uchar *) Img1->imageData + filaW * Img1->widthStep;
        pImgGRAY = (uchar *) ImgGRAY->imageData + filaW * ImgGRAY->widthStep;

        for (columnaW = 0; columnaW < Img1->width; columnaW++){
            uchar B = 0.114 * (*pImg++);
            uchar G = 0.587 * (*pImg++);
            uchar R = 0.299 * (*pImg++);
            uchar Y = B+G+R;
            
            *pImgGRAY++ = Y;
            *pImgGRAY++ = Y;
            *pImgGRAY++ = Y;}}
    
    cvNamedWindow("Frutas Grises", 1);
    cvShowImage("Frutas Grises", ImgGRAY); cvWaitKey(0);
    cvDestroyWindow("Frutas Grises");
    
    IplImage* ImgFULL = cvCreateImage(cvSize(Img1->width,Img1->height*2), IPL_DEPTH_8U, 3);
    uchar *pImgF;
    int filaF=0, filaAux=0, columnaF;

    for (filaF; filaF < Img1->height; filaF++) {
        pImg = (uchar *) Img1->imageData + filaF * Img1->widthStep;
        pImgF = (uchar *) ImgFULL->imageData + filaAux * ImgFULL->widthStep;
        
        for (columnaF = 0; columnaF < Img1->width; columnaF++){
            *pImgF++ = *pImg++;
            *pImgF++ = *pImg++;
            *pImgF++ = *pImg++;}
        
        filaAux++;
    } filaF++; filaAux=0;
    
    /*for (filaF; filaF < ImgBLUE->height*2; filaF++) {
        pImgBLUE = (uchar *) ImgBLUE->imageData + filaF * ImgBLUE->widthStep;
        pImgF = (uchar *) ImgFULL->imageData + filaAux * ImgFULL->widthStep;
        
        for (columnaF = 0; columnaF < ImgBLUE->width; columnaF++){
            *pImgF++ = *pImgBLUE++;
            *pImgF++ = *pImgBLUE++;
            *pImgF++ = *pImgBLUE++;}
        
        filaAux++;
    } filaF++; filaAux=0;
    */
    
    cvNamedWindow("Frutas Total", 0);
    cvShowImage("Frutas Total", ImgFULL); cvWaitKey(0);
    cvDestroyWindow("Frutas Total");
    
    cvReleaseImage(&Img1); 
    cvReleaseImage(&ImgBLUE);
    cvReleaseImage(&ImgGREEN);
    cvReleaseImage(&ImgRED);
    cvReleaseImage(&ImgGRAY);
    cvReleaseImage(&ImgFULL);
    
    return EXIT_SUCCESS;
};

//notas:
    //CV_LOAD_IMAGE_COLOR = 1 forces the resultant IplImage to be colour.
    //CV_LOAD_IMAGE_GRAYSCALE = 0 forces a greyscale IplImage.
    //CV_LOAD_IMAGE_UNCHANGED = -1

    /*for (int i=0; i<((Img1->height)*(Img1->widthStep)-1); i++){
        pImg = (uchar *) Img1->imageData + i;
        *pImgF++=*pImg++;
        *pImgF++=*pImg++;
        *pImgF++=*pImg++;
    }*/

//cvSize(Img1->width,5*Img1->height)