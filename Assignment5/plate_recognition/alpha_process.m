function [alpha,alpha_table] = alpha_process(im_alpha)
% This function is to crop alphabet template and create 
% a character library to store all characters
% Args:
%   im_alpha: input template image
% Returns:
%   alpha: cells containing separate characters
%   alpha_table: an array containing index in alpha
%---------------------------------------------------

% Alphbet segmentation
im_bw_alpha = (im_alpha~=0);
bbox = struct2cell(regionprops(im_bw_alpha,'BoundingBox'));
alpha = cell(1,36);
for i = 1:1:36
    alpha{i} = imcrop(im_bw_alpha,bbox{i+1});
end
% Alpha table generation
alpha_table = ['A','0','5','K','U','6','1','B','V',...
               'L','W','2','7','M','C','3','8','X',...
               'D','N','4','9','Y','O','E','Z','F',...
               'P','G','Q','H','R','S','I','J','T'];           
end