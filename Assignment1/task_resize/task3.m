im = imread('lenna512.bmp');
im_Qpre = uint8(im./16.0);
im_Q = floor(im_Qpre);
imshow(im_Q,gray(16));

