#ifndef __CORNER_HEAD_H_
#define __CORNER_HEAD_H_

#include "hls_video.h"
#include "ap_axi_sdata.h"

//����ͼ��Ĵ�С
#define WIDTH 1024
#define HEIGHT 768

//�����������ͼ��
#define SRC_IMAGE "screen.bmp"//����ͼ��·��
#define DST_IMAGE "DstImage.bmp"//���ͼ��·��
#define GOLD_IMAGE "GoldImage.bmp"//�ο�ͼ��·��

//����ͼ����������

//����AXI-Stream������
typedef ap_axiu<24,1,1,1> int_sideChannel;
typedef hls::stream<ap_axiu<24,1,1,1> > AXI_STREAM ;

//����ͼ���������ͼ������е����ظ�ʽΪ3ͨ��8λ�޷�������RGBͼ��
typedef hls::Mat<HEIGHT,WIDTH,HLS_8UC3> IMAGE_RGB;

//����ͼ������ÿ�����ظ�ʽ��3ͨ��8λ�޷�����
typedef hls::Scalar<3,unsigned char> PIXEL_RGB;

//����ͼ���������ͼ������е����ظ�ʽΪ1ͨ��8λ�޷��������Ҷ�ͼ��
typedef hls::Mat<HEIGHT,WIDTH,HLS_8UC1> IMAGE_GRAY;

//����ͼ������ÿ�����ظ�ʽ��1ͨ��8λ�޷�����
typedef hls::Scalar<1,unsigned char> PIXEL_GRAY;


//top function
void rgb2gray(IMAGE_RGB & imgIn, IMAGE_RGB & imgOut_3C, IMAGE_GRAY & imgOut_1C);
void doCorner(AXI_STREAM & inStream,AXI_STREAM & outStream);
#endif
