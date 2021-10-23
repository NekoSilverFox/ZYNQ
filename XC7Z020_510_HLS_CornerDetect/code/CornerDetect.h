#ifndef __CORNER_HEAD_H_
#define __CORNER_HEAD_H_

#include "hls_video.h"
#include "ap_axi_sdata.h"

//定义图像的大小
#define WIDTH 1024
#define HEIGHT 768

//定义输入输出图像
#define SRC_IMAGE "screen.bmp"//输入图像路径
#define DST_IMAGE "DstImage.bmp"//输出图像路径
#define GOLD_IMAGE "GoldImage.bmp"//参考图像路径

//定义图像数据类型

//定义AXI-Stream数据流
typedef ap_axiu<24,1,1,1> int_sideChannel;
typedef hls::stream<ap_axiu<24,1,1,1> > AXI_STREAM ;

//定义图像矩阵，其中图像矩阵中的像素格式为3通道8位无符号数，RGB图像
typedef hls::Mat<HEIGHT,WIDTH,HLS_8UC3> IMAGE_RGB;

//定义图像矩阵的每个像素格式，3通道8位无符号型
typedef hls::Scalar<3,unsigned char> PIXEL_RGB;

//定义图像矩阵，其中图像矩阵中的像素格式为1通道8位无符号数，灰度图像
typedef hls::Mat<HEIGHT,WIDTH,HLS_8UC1> IMAGE_GRAY;

//定义图像矩阵的每个像素格式，1通道8位无符号型
typedef hls::Scalar<1,unsigned char> PIXEL_GRAY;


//top function
void rgb2gray(IMAGE_RGB & imgIn, IMAGE_RGB & imgOut_3C, IMAGE_GRAY & imgOut_1C);
void doCorner(AXI_STREAM & inStream,AXI_STREAM & outStream);
#endif
