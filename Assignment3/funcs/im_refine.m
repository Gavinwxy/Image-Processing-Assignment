function im_re = im_refine(im)
[M,N] = size(im);
im_re = zeros([M,N]);
threshold = 0.001;
for m=1:1:M
    for n=1:1:N
        if abs(im(m,n))>threshold
            im_re(m,n)=im(m,n);
        else
            im_re(m,n)=0;
        end
    end
end