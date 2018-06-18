function [eh_im,k1,k2,k3,b2,b3] = plf_eh(org_im,codnt1,codnt2)
start_point = [0,0];
end_point = [255,255];
x1 = start_point(1); y1 = start_point(2);
x2 = codnt1(1); y2 = codnt1(2);
x3 = codnt2(1); y3 = codnt2(2);
x4 = end_point(1);y4 = end_point(2);

k1 = (y2-y1)/(x2-x1);
k2 = (y3-y2)/(x3-x2);
k3 = (y4-y3)/(x4-x3);

b1 = 0;
b2 = y2-k2*x2;
b3 = y3-k3*x3;
[dim1,dim2] = size(org_im);
eh_im = zeros([dim1,dim2]);
for i = 1:dim1
    for j = 1: dim2
        if org_im(i,j)<x2
            eh_im(i,j) = k1*org_im(i,j);
        elseif (org_im(i,j)>=x2&&org_im(i,j)<=x3)
            eh_im(i,j) = k2*org_im(i,j)+b2;
        else
            eh_im(i,j) = k3*org_im(i,j)+b3;
        end
    end
end
eh_im = uint8(eh_im);
end

