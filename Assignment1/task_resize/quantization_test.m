im = imread('lenna512.bmp');
new_im = quantization(im,4);
imshow(new_im);