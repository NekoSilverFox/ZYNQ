img_rgb=imread('Lena.bmp');    %����·���µ�ͼ��
img_gray=rgb2gray(img_rgb);
imtool(img_gray);   
se=strel('disk',1);       %����Բ�νṹԪ��
I2=imerode(img_gray,se);        %�����ɵĽṹԪ�ض�ͼ����и�ʴ
imtool(I2);