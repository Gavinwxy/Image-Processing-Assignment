function [lic_preds] = detect_car_license_plate_v1(im_plate,im_alpha)
% This function is to recognize a car plate only apply erosion
% Args:
%    im_plate: car plate image
%    im_alpha: alphanumeric template image
% Returns:
%    lic_preds: string containing recognize result 
%--------------------------------------------------------
[alpha,alpha_table] = alpha_process(im_alpha);
rect = [146 1 480 176];
im_plate_crop = imcrop(im_plate,rect);
im_bw_plate = (im_plate_crop>=8);
bbox = struct2cell(regionprops(im_bw_plate,'BoundingBox'));

region = [100 100];
lic_alpha=cell(1,8);
alpha_idx = zeros([1,8]);

% Create licence block for predition
for i = 1:1:8
    lic_alpha{i} = imcrop(im_bw_plate,bbox{i});
    template_size = size(lic_alpha{i});
    lic_alpha{i} = padarray(lic_alpha{i},floor((region-template_size)/2));
end

% Start comparision
template_num = length(alpha);
lic_num = length(lic_alpha);
se = strel('square',3);

for i=1:1:lic_num
    for j = 1:1:template_num
        temp1 = padarray(alpha{j},[10,10]); 
        temp2 = imerode(temp1,se);   
        result = imerode(lic_alpha{i},temp2);
        % Focus on central region 
        cmp = (sum(sum(result(25:75,25:75)))>1);
        if cmp
            alpha_idx(i)= j;
            %break;
        end
    end
end

% Map prediction from alphabet table
lic_preds = zeros([1,8]);
for i = 1:1:8
lic_preds(i) = alpha_table(alpha_idx(i));
end
lic_preds = char(lic_preds);
end