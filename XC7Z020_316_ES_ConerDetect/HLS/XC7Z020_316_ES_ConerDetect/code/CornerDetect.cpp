#include "CornerDetect.h"

void rgb2gray(IMAGE_RGB & imgIn, IMAGE_RGB & imgOut_3C, IMAGE_GRAY & imgOut_1C){
	PIXEL_RGB 	pixIn;
	PIXEL_RGB 	pixOut_3C;
	PIXEL_GRAY	pixOut_1C;

	for(int idxRow = 0; idxRow < HEIGHT; idxRow++){
		for(int idxCol = 0; idxCol < WIDTH; idxCol++){
			//输入图像是三通道的RGB图像
			imgIn >> pixIn;
			unsigned short R = pixIn.val[0];
			unsigned short G = pixIn.val[1];
			unsigned short B = pixIn.val[2];

			//输出三�?�道图像，各个�?�道都是灰度值，�?终显示出来的图像是灰度图
			pixOut_3C.val[0] = (unsigned char) ((R*76 + G*150 + B*30) >> 8);
			pixOut_3C.val[1] = (unsigned char) ((R*76 + G*150 + B*30) >> 8);
			pixOut_3C.val[2] = (unsigned char) ((R*76 + G*150 + B*30) >> 8);

			//输出单�?�道图像，只有一个�?�道，为灰度图像
			pixOut_1C.val[0] = (unsigned char) ((R*76 + G*150 + B*30) >> 8);
			imgOut_3C << pixOut_3C;
			imgOut_1C << pixOut_1C;
		}
	}
}

void doCorner(AXI_STREAM & inStream,AXI_STREAM & outStream){
#pragma HLS INTERFACE axis  port=outStream
#pragma HLS INTERFACE axis  port=inStream
#pragma HLS INTERFACE s_axilite port=return bundle=CTRL_BUS


	IMAGE_RGB img_0;
	IMAGE_RGB img_1;
	IMAGE_GRAY img_2;
	IMAGE_RGB img_3;
	IMAGE_GRAY mask;
	IMAGE_GRAY dmask;

#pragma HLS dataflow
#pragma HLS stream depth=20000 variable=img_1_.data_stream
	hls::AXIvideo2Mat(inStream, img_0);
	PIXEL_RGB color(255,255,0);
	rgb2gray(img_0, img_1, img_2);
	hls::FASTX(img_2, mask, 20, true);// 快�?�脚点检�?
	hls::Dilate(mask, dmask);//对检测出来的点进行膨�?
	hls::PaintMask(img_1, dmask, img_3, color);//将膨�?后的点添加到图像
	hls::Mat2AXIvideo(img_3, outStream);
}
