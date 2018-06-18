function [rate,zigzag_size,im_dct_qtz] = compress_im_zigzag(im, Qmat,QP, N, file_name)
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
block_zigzag = @(block_struct) zigzag(block_struct.data);
im_dct_qtz = blockproc(im, [N N], block_dct_qtz);
im_zigzag = blockproc(im_dct_qtz, [N N], block_zigzag);
imsize = size(im);
zigzag_size = size(im_zigzag);
%% Write file and evaluate
entropy_encode = entropy_enc(im_zigzag);
file = fopen(file_name,'w');
fwrite(file,entropy_encode,'uint8');
fclose(file);
rate = fsize(file_name)*8/(imsize(1)*imsize(2));
end