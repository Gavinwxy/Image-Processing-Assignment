%% 
filter=ones([611,588]);
filter(299:311,:) = 0;
filter(:,288:300) = 0;
filter(290:320,279:309)=1;
% imshow(filter);
%%
test_filter = imread('test_filter.bmp');
test_filter = test_filter(:,:,1);
for i=1:1:611
    for j=1:1:588
        if test_filter(i,j)~=0
            test_filter(i,j) = 1;
        end
    end
end
test_filter = double(test_filter);