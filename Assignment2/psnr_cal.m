function psnr = psnr_cal(im1,im2)
% This function takes two images im1 and im2 
% and calculate PSNR between them
[dim1,dim2] = size(im1);
MSE = sum(sum((im1 - im2).^2))/(dim1*dim2); 
psnr = 10*log10(255^2/MSE);
end

