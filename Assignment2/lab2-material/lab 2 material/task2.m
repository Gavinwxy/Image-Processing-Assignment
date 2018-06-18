im = imread('lenna512.bmp');
im_wn = imnoise(im,'gaussian',0,10);
im_sp = imnoise(im,'salt & pepper',0.1);
im_low_dynamic_range = imread('lenna512_low_dynamic_range.bmp');

psnr_wn = psnr_cal(im_wn,im);
psnr_sp = psnr_cal(im_sp,im);
psnr_low_dynamic_range = psnr_cal(im_low_dynamic_range,im);

imshow(in_wn);