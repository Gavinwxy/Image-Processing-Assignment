%%
width = 256; 
N=width/16; 
n=[1:width]-1; 
%x = 1+cos(2*pi*n/N);
x = 1+cos(2*pi*n/N)+cos(4*pi*n/N);
im = ones(width, 1)*x;
figure; imshow(im);
%%
im_dft = fft2(im);
figure; imshow(log(abs(im_dft)));
im_dft_shift = fftshift(im_dft);
im_dft_final = log(abs(im_dft_shift));
figure; imshow(im_dft_final);
