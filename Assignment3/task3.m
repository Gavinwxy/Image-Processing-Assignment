%%
im = imread('fence.jpg');
% Separate channels
redIm = im(:,:,1);
greenIm = im(:,:,2);
blueIm = im(:,:,3);
% Do dft for each channel
red_dft = fftshift(fft2(redIm));
green_dft = fftshift(fft2(greenIm));
blue_dft = fftshift(fft2(blueIm));
% Filter images
task3_filter;
red_filt = red_dft.*test_filter;
green_filt = green_dft.*test_filter;
blue_filt = blue_dft.*test_filter;
% Inverse transform on each channel
red_re = uint8(abs(ifft2(ifftshift(red_filt))));
green_re = uint8(abs(ifft2(ifftshift(green_filt))));
blue_re  = uint8(abs(ifft2(ifftshift(blue_filt))));
% Stack 3 channels back to recover 
im_re = cat(3, red_re, green_re, blue_re);
imshow(im_re);


