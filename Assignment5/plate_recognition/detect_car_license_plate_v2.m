function [lic_preds] = detect_car_license_plate_v2(im_plate,im_alpha)
% This function is to recognize a car plate with hit and miss
% Args:
%    im_plate: car plate image
%    im_alpha: alphanumeric template image
% Returns:
%    lic_preds: string containing recognize result 
%--------------------------------------------------------

[alpha,alpha_table] = alpha_process(im_alpha);
[alpha_hit,alpha_miss] = hit_miss_generation(alpha);
rect = [146 1 480 176];
im_plate_crop = imcrop(im_plate,rect);
im_bw_plate = (im_plate_crop>=8);
bbox = struct2cell(regionprops(im_bw_plate,'BoundingBox'));

region = [100 100];
lic_alpha=cell(1,8);
lic_bg = cell(1,8);
alpha_idx = zeros([1,8]);

% Create licence character and its background
for i = 1:1:8
    lic_alpha{i} = imcrop(im_bw_plate,bbox{i});
    char_size = size(lic_alpha{i});
    lic_alpha{i} = padarray(lic_alpha{i},floor((region-char_size)/2));
    lic_bg{i} = ~lic_alpha{i};
end

% Start comparision
template_num = length(alpha_hit);
lic_num = length(lic_alpha);

for i=1:1:lic_num
    for j = 1:1:template_num
        hit_result = imerode(lic_alpha{i},alpha_hit{j});
        miss_result = imerode(lic_bg{i},alpha_miss{j});
        final_result = hit_result.*miss_result;
        % Focus on central region 
        cmp = (sum(sum(final_result(25:75,25:75)))>1);
        if cmp
            alpha_idx(i)= j;
            %break; % For shorter run time  after debugging
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