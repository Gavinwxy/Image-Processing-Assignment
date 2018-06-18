function [rate,imsize,im_dct_qtz] = compress_im(im, Qmat,QP, N, file_name)
%----------------------------------------------------------------------
% This function is to do image compression
% Agrs:
%   im: input image to be compressed
%   Qmat: base quantization matrix 
%   QP: compressiong quality factor
%   N: operation block size (Qmat size)
%   file_name: name of the file to store encoded image
% Returns:
%   rate: bit rate (bits per pixel)
%   imsize: Input image size
%   im_dct_qtz: matrix of image after dct and quantization
%----------------------------------------------------------------------

%% Quantization matrix generation
if QP > 50
    S = (100-QP)/50;
else
    S = 50/QP;
end
Qmat_s = S.*Qmat;
Qmat_s(Qmat_s==0) = 1;
%% Do DCT and quantization for each block
block_dct_qtz = @(block_struct) round(dct2(block_struct.data)./Qmat_s);
im_dct_qtz = blockproc(im, [N N], block_dct_qtz);
imsize = size(im);
%% Write file and evaluate
entropy_encode = entropy_enc(im_dct_qtz);
file = fopen(file_name,'w');
fwrite(file,entropy_encode,'uint8');
fclose(file);
rate = fsize(file_name)*8/(imsize(1)*imsize(2));
end