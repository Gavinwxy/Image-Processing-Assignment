org_im = imread('lenna512.bmp');
new_im1 = nearest_neighbor(org_im,0.5);
new_im2 = nearest_neighbor(new_im1,2);
new_im3 = bilinear(org_im,0.5);
new_im4 = bilinear(new_im3,2);
%% PSNR calculation
peaksnr1 = psnr(new_im2,org_im);
peaksnr2 = psnr(new_im4,org_im);
%% Display
figure; imshow(new_im1);
figure; imshow(new_im2);
figure; imshow(new_im3);
figure; imshow(new_im4);