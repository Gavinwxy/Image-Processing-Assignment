function [alpha_hit,alpha_miss] = hit_miss_generation(alpha)
% This function is to generate SE for hit and miss operation
% Args:
%    alpha: the character library.
% Returns:
%    alpha_hit: SE for foreground detection
%    alpha_miss: SE for background detection
%-----------------------------------------------------------
% Initialization
se = strel('square',3);
alpha_num = length(alpha);
region = [100,100];
alpha_hit = cell(1,alpha_num);
alpha_dilate = cell(1,alpha_num);
alpha_miss = cell(1,alpha_num);

for i = 1:1:alpha_num
    temp = padarray(alpha{i},[10,10]);
    alpha_hit{i} = imerode(temp,se);
    alpha_dilate{i} = imdilate(alpha{i},se);
    alpha_size = size(alpha_dilate{i});
    alpha_miss{i} = padarray(alpha_dilate{i},floor((region-alpha_size)/2));
    alpha_miss{i} = ~alpha_miss{i};
end
end