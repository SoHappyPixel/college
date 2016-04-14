#include <stdio.h>
#include <limits.h>
#include <pthread.h> 
#include <emmintrin.h>
#include <opencv2/core/core_c.h>
#include <opencv2/highgui/highgui_c.h>

#define NTHREADS 4

CvCapture *capture;
IplImage *bug, *frame;
int cont, rowTrue, colTrue;

void cvThread(void *ptr)
{
    uchar *pFrame, *pBug;
    int *iniRow = (int*) ptr;
    int areaX, areaY, bugX, bugY;
    int tempDif=0, auxRow=0, difColor=INT_MAX;
    rowTrue=0, colTrue=0;
    
    for(areaX=190; areaX < 260; areaX+=1)
    {
        for(areaY=700; areaY< 1000; areaY+=1)
        {
            for(bugX=(areaX+(*iniRow)); bugX < (areaX+(*iniRow))+48; bugX+=NTHREADS)
            {
                pFrame = (uchar *) frame->imageData + bugX * frame->widthStep + areaY;
                pBug = (uchar *) bug->imageData + auxRow * bug->widthStep; 

                auxRow++;

                 for(bugY=0; bugY<48; bugY++)
                 {
                    if(*pBug==255 && *(pBug+1)==255 && *(pBug+2)==255)
                    {
                        pBug += 3;
                        pFrame += 3;
                    } 
                    else
                    {
                        tempDif += abs(*pBug++ - *pFrame++);
                        tempDif += abs(*pBug++ - *pFrame++);
                        tempDif += abs(*pBug++ - *pFrame++);
                    }
                }
            }

            if(tempDif<difColor)
            {
                difColor = tempDif;
                rowTrue = areaX;
                colTrue = areaY;
            } 

            tempDif=0;
            auxRow=0;
        }
    }
}

int main(int argc, char** argv){
    capture = cvCaptureFromFile(argv[2]);
    frame = cvQueryFrame(capture);
    bug = cvLoadImage(argv[1],1);
    
    pthread_t threadsID[NTHREADS];

    while(frame)
    {
        for(cont = 0; cont < NTHREADS; cont++)
            pthread_create(&threadsID[cont], NULL, (void *) &cvThread, (void *) &cont);
        
        for(cont = 0; cont < NTHREADS; cont++)
            pthread_join(threadsID[cont], NULL);
        
        cvRectangle(frame,cvPoint((colTrue/3),rowTrue),cvPoint((colTrue/3)+48,rowTrue+48),CV_RGB(0,255,255),1,CV_AA,0);
        
        cvShowImage("Frame",frame);
        cvWaitKey(1);
        
        frame = cvQueryFrame(capture); 
    }
    return EXIT_SUCCESS;
}
