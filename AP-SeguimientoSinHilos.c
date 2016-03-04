#include <opencv2/highgui/highgui_c.h>
#include <opencv2/core/core_c.h>
#include <limits.h>
#include <stdio.h>

void cvBuscar(const IplImage* frame, const IplImage* muestra, int *fM, int *cM, int *difM)
{
    
    uchar *pC, *pM;
    int fI, cI, fC, cC, fAux, difC=0;
    
    for(fI=190; fI < 260; fI+=1)
    {
        for(cI=700; cI< 1000; cI+=1)
        { 
        	difC=0; fAux=0;

            for(fC=fI; fC< fI+48; fC++){
                pC= (uchar *) frame->imageData + fC * frame->widthStep + cI;
                pM= (uchar *) muestra->imageData + fAux * muestra->widthStep; fAux++;

                 for(cC=0; cC<48; cC++)
                 {
                    if(*pM==255 && *(pM+1)==255 && *(pM+2)==255)
                    {
                    	pM+=3;
                    	pC+=3;
                    }

                    else
					{
                        difC += abs(*pM++ - *pC++);
                        difC += abs(*pM++ - *pC++);
                        difC += abs(*pM++ - *pC++);
                    }
                }
            }

            if(difC<*difM)
            {
                *difM=difC;
                *fM=fI;
                *cM=cI;
            }
        }
    }
}

int main(int argc, char** argv)
{
    
    CvCapture* capture = cvCaptureFromFile(argv[2]);
    IplImage* frame = cvQueryFrame(capture);
    IplImage* muestra  = cvLoadImage(argv[1], 1);
    int fM,cM,difM;
    
    while(frame)
    {
        fM=0, cM=0, difM=INT_MAX;
        cvBuscar(frame,muestra,&fM,&cM,&difM);
        cvRectangle(frame,cvPoint((cM/3),fM),cvPoint((cM/3)+48,fM+48),CV_RGB(0,255,255),2,CV_AA,0);
        
        frame = cvQueryFrame(capture);
    }
	return EXIT_SUCCESS;
}
