%% Initialize images to be tested
im1 = [1,0,0,0;1,0,0,0;1,0,0,0;1,0,0,0];
im2 = [0,0,0,0;1,1,1,1;0,0,0,0;0,0,0,0];
im3 = [1,0,0,0;0,1,0,0;0,0,1,0;0,0,0,1];
%% Base generation and prjection
[bases] = base_generate(4,1);
[im1_dct, dct_bases1,indexCnt1] = projection_an_image_on_its_DCT_bases(im1);
[im2_dct, dct_bases2,indexCnt2] = projection_an_image_on_its_DCT_bases(im2);
[im3_dct, dct_bases3,indexCnt3] = projection_an_image_on_its_DCT_bases(im3);
%% Image recovery from frequency domain
[im1_recover] = recover_from_dct(im1_dct,dct_bases1,bases);
[im2_recover] = recover_from_dct(im2_dct,dct_bases2,bases);
[im3_recover] = recover_from_dct(im3_dct,dct_bases3,bases);
%% Image Refine (Set very small number to 0)
im1_re = im_refine(im1_recover);
im2_re = im_refine(im2_recover);
im3_re = im_refine(im3_recover);
%% Result Illustration
figure;
subplot(3,3,1);
imshow(im1);
subplot(3,3,2);
imshow(im2);
subplot(3,3,3);
imshow(im3);
im1_dct_plot = mat2gray(im1_dct);
im2_dct_plot = mat2gray(im2_dct);
im3_dct_plot = mat2gray(im3_dct);
subplot(3,3,4);
imshow(im1_dct_plot);
subplot(3,3,5);
imshow(im2_dct_plot);
subplot(3,3,6);
imshow(im3_dct_plot);
subplot(3,3,7);
imshow(im1_re);
subplot(3,3,8);
imshow(im2_re);
subplot(3,3,9);
imshow(im3_re);