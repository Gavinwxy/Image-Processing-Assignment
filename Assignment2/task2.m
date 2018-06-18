%% Add noise
im = imread('lenna512.bmp');
im_wn = imnoise(im,'gaussian',0,10^2/255^2); 
imwrite(im_wn,'F:\OneDrive\Assignment\EEE330_IP\Assignment2\fig\lenna_gs.jpg');
im_sp = imnoise(im,'salt & pepper',0.1); 
imwrite(im_sp,'F:\OneDrive\Assignment\EEE330_IP\Assignment2\fig\lenna_sp.jpg');
im_low_dynamic_range = imread('lenna512_low_dynamic_range.bmp');
%% Calcualte PSNR
psnr_wn = psnr_cal(im_wn,im);
psnr_sp = psnr_cal(im_sp,im);
psnr_low_dynamic_range = psnr_cal(im_low_dynamic_range,im);
%% Show histogram
figure;imhist(im); title('Reference Image','fontsize',14)
figure;imhist(im_wn); title('White Noise Image','fontsize',14)
figure;imhist(im_sp); title('Salt and Pepper Image','fontsize',14)
figure;imhist(im_low_dynamic_range); title('Low Dynamic Range Image','fontsize',14)