im_org = imread('lenna512_low_dynamic_range.bmp');
im_eh = histeq_eh(im_org);
%imwrite(im_eh,'F:\OneDrive\Assignment\EEE330_IP\Assignment2\fig\im_hist_enhance.jpg');
figure;
imhist(im_eh);
title('Histogram Equalization Method','fontsize',14)