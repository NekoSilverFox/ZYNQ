img_rgb=imread('Lena.bmp');    %载入路径下的图像
img_gray=rgb2gray(img_rgb);
imtool(img_gray);   
se=strel('disk',1);       %生成圆形结构元素
I2=imerode(img_gray,se);        %用生成的结构元素对图像进行腐蚀
imtool(I2);