im = imread('Lenna512_SandP.bmp');
refim = imread('lenna512.bmp');
im_med1 = medfilt2(im,[3 3]);
im_med2 = medfilt2(im,[5 5]);
psnr_med1 = psnr(im_med1,refim);
psnr_med2 = psnr(im_med2,refim);
%imwrite(im_med1,'F:\OneDrive\Assignment\EEE330_IP\Assignment2\fig\ft_m_3.jpg')
%imwrite(im_med2,'F:\OneDrive\Assignment\EEE330_IP\Assignment2\fig\ft_m_5.jpg')

flt_A = fspecial('average',[3 3]);
im_average = imfilter(im, flt_A);
%imwrite(im_average,'F:\OneDrive\Assignment\EEE330_IP\Assignment2\fig\ft_a.jpg')
psnr_average = psnr(im_average,refim);

figure; imshow(im);
figure; imshow(im_med1);
figure; imshow(im_med2);
figure; imshow(im_average);