#include "CornerDetect.h"

void rgb2gray(IMAGE_RGB & imgIn, IMAGE_RGB & imgOut_3C, IMAGE_GRAY & imgOut_1C){
	PIXEL_RGB 	pixIn;
	PIXEL_RGB 	pixOut_3C;
	PIXEL_GRAY	pixOut_1C;

	for(int idxRow = 0; idxRow < HEIGHT; idxRow++){
		for(int idxCol = 0; idxCol < WIDTH; idxCol++){
			//����ͼ������ͨ����RGBͼ��
			imgIn >> pixIn;
			unsigned short R = pixIn.val[0];
			unsigned short G = pixIn.val[1];
			unsigned short B = pixIn.val[2];

			//�����ͨ��ͼ�񣬸���ͨ�����ǻҶ�ֵ��������ʾ������ͼ���ǻҶ�ͼ
			pixOut_3C.val[0] = (unsigned char) ((R*76 + G*150 + B*30) >> 8);
			pixOut_3C.val[1] = (unsigned char) ((R*76 + G*150 + B*30) >> 8);
			pixOut_3C.val[2] = (unsigned char) ((R*76 + G*150 + B*30) >> 8);

			//�����ͨ��ͼ��ֻ��һ��ͨ����Ϊ�Ҷ�ͼ��
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
	hls::FASTX(img_2, mask, 20, true);// ���ٽŵ���
	hls::Dilate(mask, dmask);//�Լ������ĵ��������
	hls::PaintMask(img_1, dmask, img_3, color);//�����ͺ�ĵ���ӵ�ͼ��
	hls::Mat2AXIvideo(img_3, outStream);
}
