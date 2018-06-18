function new_im = bilinear(org_im,scale)
% Org_im: Input original image
% scale: scale fo resize operation
% new_im: Resized image;

[dim1, dim2] = size(org_im);
newdim1 = dim1*scale;
newdim2 = dim2*scale;
new_im = zeros([newdim1,newdim2]);

for i=1:newdim1
    for j =1:newdim2
        scale_dim1 = i/scale; 
        scale_dim2 = j/scale;
        refdim1 = floor(scale_dim1);
        refdim2 = floor(scale_dim2);
        u = scale_dim1 - refdim1;
        v = scale_dim2 - refdim2;
        if refdim1==0
             refdim1=1;
        else if refdim1>=dim1
             refdim1=dim1-1;
            end
        end
        if refdim2==0
           refdim2=1;
        else if refdim2>=dim2
           refdim2=dim2-1;
            end
        end
         new_im(i,j)=u*v*org_im(refdim1+1,refdim2+1)+(1-u)*(1-v)...
         *org_im(refdim1,refdim2)+u*(1-v)*org_im(refdim1,refdim2+1)...
         +(1-u)*v*org_im(refdim1+1,refdim2);
    end
end
new_im = uint8(new_im);
end