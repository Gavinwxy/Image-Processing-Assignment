function [im_DCT, DCT_bases,indexCnt] = projection_an_image_on_its_DCT_bases(im)
% This function is to prject an image in spacial domain into frequency
% domain.
% args:
%   im is the original image
% Return:
%   im_DCT is the transformed image
%   DCT_bases is indices of base with none zero coeffiecient
%   indexCnt is the count of useful bases

im_DCT = dct2(im);
[M,N] = size(im);
DCT_bases = zeros([M*N,2]);
threshold = 0.001;
indexCnt = 0;
for m=1:1:M
    for n=1:1:N
        if abs(im_DCT(m,n))>threshold
            DCT_bases(indexCnt+1,:)=[m,n];
            indexCnt = indexCnt+1;
        end
    end
end
DCT_bases = DCT_bases(1:indexCnt,:);
end
