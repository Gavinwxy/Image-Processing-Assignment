function eh_im = histeq_eh(org_im)
% This function takes an input image and do contrast by the method 
%  of histogram equalization

[counts,bins] = imhist(org_im);
[dim1,dim2] = size(org_im);

num_lv = length(bins); % Total number of color levels
accum_lv = zeros(length(counts)); % A matrix to store accumulated pixel numbers
eh_im = zeros([dim1,dim2]); % A matrix to store new image
pr_factor = (max(num_lv)-1)/(dim1*dim2); % Calcualte (L-1)/(MN)

for i=1:num_lv 
    if i == 1
        accum_lv(i) = counts(i);
    else
        accum_lv(i) = counts(i) + accum_lv(i-1); % Accumulated pixle number
    end
    new_lv = pr_factor*accum_lv(i); % Calculate new level value
    idx = org_im==bins(i); % Obtain coordinates of pixles of current level
    eh_im(idx)=new_lv; % Replace original level by new value
end
eh_im = uint8(eh_im);
end
