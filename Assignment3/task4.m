%%
im_440 = imread('lenna_ds440.bmp');
im_420 = imread('lenna_ds420.bmp');
im_ref = imread('lenna512.bmp');
%%
im_420_zero = zeroresize(im_420,[512 512]);
im_440_zero = zeroresize(im_440,[512 512]);
%%
im_420_nearest = imresize(im_420,[512 512],'nearest');
im_440_nearest = imresize(im_440,[512 512],'nearest');
%%
im_420_lanczos3 = imresize(im_420,[512 512],'lanczos3');
im_440_lanczos3 = imresize(im_440,[512 512],'lanczos3');
%%
psnr_420_zero = psnr(im_420_zero,im_ref);
psnr_440_zero = psnr(im_440_zero,im_ref);
psnr_420_neareast = psnr(im_420_nearest,im_ref);
psnr_440_neareast = psnr(im_440_nearest,im_ref);
psnr_420_lanczos3 = psnr(im_420_lanczos3,im_ref);
psnr_440_lanczos3 = psnr(im_440_lanczos3,im_ref);
%%
%imwrite(im_420_zero,'F:\OneDrive\Assignment\EEE330_IP\Assignment3\im_420_zero.jpg');
%imwrite(im_440_zero,'F:\OneDrive\Assignment\EEE330_IP\Assignment3\im_440_zero.jpg');
%imwrite(im_420_nearest,'F:\OneDrive\Assignment\EEE330_IP\Assignment3\im_420_nearest.jpg');
%imwrite(im_440_nearest,'F:\OneDrive\Assignment\EEE330_IP\Assignment3\im_440_nearest.jpg');
%imwrite(im_420_lanczos3,'F:\OneDrive\Assignment\EEE330_IP\Assignment3\im_420_lanczos3.jpg');
%imwrite(im_440_lanczos3,'F:\OneDrive\Assignment\EEE330_IP\Assignment3\im_440_lanczos3.jpg');