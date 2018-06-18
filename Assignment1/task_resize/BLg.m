function new_im = BLg(org_im,scale)
% this function is design to amplify or shink an image
[dim1,dim2] = size(org_im);
newdim1 = dim1*scale;
newdim2 = dim2*scale;
new_im = zeros([newdim1,newdim2]);

if scale > 1
    for i=1:newdim1
        for j=1:newdim2
            x_scale=i/scale;
            y_scale=j/scale;

            refdim1=floor(x_scale);
            u=x_scale-refdim1;

            refdim2=floor(y_scale);
            v=y_scale-refdim2;

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

           new_im(i,j)=u*v*org_im(refdim1+1,refdim2+1)+(1-u)*(1-v)*org_im(refdim1,refdim2)...
                +u*(1-v)*org_im(refdim1,refdim2+1)+(1-u)*v*org_im(refdim1+1,refdim2);

        end


    end
end
new_im=uint8(new_im);
end