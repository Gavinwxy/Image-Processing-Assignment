function [imo] = decompress_im(Qmat, QP, N, file_name,imsize)
%----------------------------------------------------------------------
% This function is to do image compression
% Agrs:
%   Qmat: base quantization matrix 
%   QP: compressiong quality factor
%   N: operation block size (Qmat size)
%   file_name: name of the file to store encoded image
%   imsize: size of image after decompression
% Returns:
%   imo: decompressed image 
%----------------------------------------------------------------------

%% Read file from .txt and decode it
file = fopen(file_name,'r');
entropy_encode = fread(file);
im_dct_qtz = entropy_dec(entropy_encode);
im_dct_qtz = reshape(im_dct_qtz,imsize);
%% Get quantization matrix
if QP > 50
    S = (100-QP)/50;
else
    S = 50/QP;
end
Qmat_s = S.*Qmat;
Qmat_s(Qmat_s==0) = 1;
%% Inverse quantization and DCT
block_idct_inqtz = @(block_struct) idct2((block_struct.data).*Qmat_s);
imo = blockproc(im_dct_qtz, [N N], block_idct_inqtz);
