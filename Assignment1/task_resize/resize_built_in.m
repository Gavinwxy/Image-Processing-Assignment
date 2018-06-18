im = imread('lenna512.bmp');
%% Nearest neighbor interpolation
ds_NNI = imresize(im,0.5,'nearest');
up_NNI = imresize(ds_NNI,2.0,'nearest');

%% Bilinear interpolation
ds_BL = imresize(im,0.5,'bilinear');
up_BL = imresize(ds_BL,2.0,'bilinear');

%% Bicubic interpolation
ds_BC = imresize(im,0.5,'bicubic');
up_BC = imresize(ds_BC,2.0,'bicubic');

%% Display resampled images
figure; imshow(ds_NNI); figure; imshow(up_NNI); 
figure; imshow(ds_BL);  figure; imshow(up_BL);
figure; imshow(ds_BC);  figure; imshow(up_BC);

%% PSNR
peaksnr1 = psnr(up_NNI,im);
peaksnr2 = psnr(up_BL,im);
peaksnr3 = psnr(up_BC,im);

