#include <stdio.h>
#include <opencv2/opencv.hpp>
#include "CornerDetect.h"
#include "hls_opencv.h"
using namespace cv ;


//ͼƬ�ȶ�
int image_compare(const char* output_image, const char* golden_image) {
    if (!(output_image) || !(golden_image)) {
        printf("Failed to open images...exiting.\n");
        return -1;
    } else {
        Mat o = imread(output_image);
        Mat g = imread(golden_image);
        assert(o.rows == g.rows && o.cols == g.cols);//assert�����ȷ����������к���ĳ��򣬷��򱨴�
        assert(o.channels() == g.channels() && o.depth() == g.depth());
        printf("rows = %d, cols = %d, channels = %d, depth = %d\n", o.rows, o.cols, o.channels(), o.depth());
        int flag = 0;
        for (int i = 0; i < o.rows && flag == 0; i++) {
            for (int j = 0; j < o.cols && flag == 0; j++) {
                for (int k = 0; k < o.channels(); k++) {
                    unsigned char p_o = (unsigned char)*(o.data + o.step[0]*i + o.step[1]*j + k);
                    unsigned char p_g = (unsigned char)*(g.data + g.step[0]*i + g.step[1]*j + k);
                    if (p_o != p_g) {
                        printf("First mismatch found at row = %d, col = %d\n", i, j);
                        printf("(channel%2d) output:%5d, golden:%5d\n", k, p_o, p_g);
                        flag = 1;
                        break;
                    }
                }
            }
        }
        if (flag)
            printf("Test Failed!\n");
        else
            printf("Test Passed!\n");

        return flag;
    }
}

int main(){
	IplImage * SrcImage;//�����ͼ��
	IplImage * DstImage;//�����ͼ��
	SrcImage = cvLoadImage(SRC_IMAGE,-1);//����ͼ��

	//����opencv֧�ֵ������ͼ��
	DstImage = cvCreateImage(cvGetSize(SrcImage),SrcImage->depth, SrcImage->nChannels);
	//AXI-Stream������
	AXI_STREAM inStream;
	AXI_STREAM outStream;

	IplImage2AXIvideo(SrcImage,inStream);

	//���ۺϵĺ���
	doCorner(inStream, outStream);
	//����������
	AXIvideo2IplImage(outStream,DstImage);
	cvSaveImage(DST_IMAGE,DstImage);

	//�ο�ͼ�����
	cvShowImage(DST_IMAGE, DstImage);
	cvWaitKey(0);


	//�ͷ�ͼƬ
	cvReleaseImage(&SrcImage);
	cvReleaseImage(&DstImage);
	return 0;


}
