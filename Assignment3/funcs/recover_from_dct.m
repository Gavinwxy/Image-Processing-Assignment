function [im_recover] = recover_from_dct(im_dct,dct_bases,bases)
% This function is to do inverse dct on image
% args:
%   im_dct is the transformed image
%   dct_bases are the indices of bases with none zero factor
%   bases are the generated bases in a 4-D matrix

size_im = size(im_dct);
im_recover = zeros(size_im);
num_indices = size(dct_bases,1);
for i=1:1:num_indices
    base_factor = im_dct(dct_bases(i,1),dct_bases(i,2));
    current_base = bases(:,:,dct_bases(i,2),dct_bases(i,1));
    im_recover = im_recover + base_factor.*current_base;
end
end




