%% Load coin image and binarize it.
im = imread('Coins.jpg');
im_coin = imresize(im,0.2);
im_hsv = rgb2hsv(im_coin);
im_sat = im_hsv(:,:,2);
im_bw = ~imbinarize(im_sat,0.5);

%% Perform erosion and dilation to get clear coin outline 
se1 = strel('disk',1);
se2 = strel('disk',2);
im_erode = imerode(im_bw,se1);
im_dilate = imdilate(im_erode,se2);

%% Perform final erosion and shrink coin to single pixle for counting
se_count = strel('disk',21);
im_pre_count = imerode(im_dilate,se_count);
im_count = bwmorph(im_pre_count,'shrink',Inf);
coin_count = length(find(im_count==1));
fprintf('There are %d coins!', coin_count);


