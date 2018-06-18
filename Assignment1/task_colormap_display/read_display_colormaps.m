imdata = imread('lenna512.bmp');
figure; image(imdata); truesize; colormap cool(256); % colormap cool(256)
figure; image(imdata); truesize; colormap hot(255); % colormap hot(255)
figure; image(imdata); truesize; colormap gray(128); % colormap gray(128)
figure; image(imdata); truesize; colormap gray(64); % colormap gray(64)