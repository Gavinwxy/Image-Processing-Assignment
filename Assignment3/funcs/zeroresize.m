function [new_im]=zeroresize(org_im, newsize)
% This function is to resize image by zero padding in frequency domain
% Args:
%   org_im is the image to be resized 
%   newsize is an array containing desired size

imsize = size(org_im);
padnum_dim1 = floor((newsize(1) - imsize(1))/2);
padnum_dim2 = floor((newsize(2) - imsize(2))/2);
scale_factor = (newsize(1)*newsize(2))/(imsize(1)*imsize(2));

org_dft = fftshift(fft2(org_im));
new_dft = padarray(org_dft,[padnum_dim1,padnum_dim2]);

new_im = scale_factor*(ifft2(ifftshift(new_dft)));
new_im = uint8(abs(new_im));
end
