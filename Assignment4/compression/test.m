%% Parameter initialization
im = double(imread('lenna512.bmp'));
N = 16;
Qmat = base_mat_generation(N);
QP = 1;
%% Compression and Decompression
[rate_s_16,zigzagsize,im_pro] = compress_im_refine(im,Qmat,QP,N,'compressim');
imo = decompress_im_refine(Qmat, QP, N, 'compressim',zigzagsize);
psnr_value = psnr(uint8(imo),uint8(im));

    