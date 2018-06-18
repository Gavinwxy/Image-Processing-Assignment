function new_im = nearest_neighbor(org_im,scale)
% Org_im: Input original image
% scale: scale fo resize operation
% new_im: Resized image;

[dim1,dim2] = size(org_im);
newdim1 = dim1*scale;
newdim2 = dim2*scale;
new_im = zeros([newdim1 newdim2]);

for i=1:newdim1
    for j =1:newdim2
        spdim1 = ceil(i/scale);
        spdim2 = ceil(j/scale);
        new_im(i,j) = org_im(spdim1,spdim2);
    end
end
new_im = uint8(new_im);
end

