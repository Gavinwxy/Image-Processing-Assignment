function [imo] = decompress_im_zigzag(Qmat, QP, N, file_name,zigzag_size)
%% Read file from .txt and decode it
file = fopen(file_name,'r');
entropy_encode = fread(file);
im_zigzag_enc = entropy_dec(entropy_encode);
im_dct_zigzag = reshape(im_zigzag_enc,zigzag_size);
%% Get quantization matrix
if QP > 50
    S = (100-QP)/50;
else
    S = 50/QP;
end
Qmat_s = S.*Qmat;
Qmat_s(Qmat_s==0) = 1;
%% Inverse quantization and DCT
block_izigzag = @(block_struct) izigzag(block_struct.data,N,N);
block_idct_inqtz = @(block_struct) idct2((block_struct.data).*Qmat_s);
im_dct_qtz = blockproc(im_dct_zigzag, [1 N*N], block_izigzag);
imo = blockproc(im_dct_qtz, [N N], block_idct_inqtz);
