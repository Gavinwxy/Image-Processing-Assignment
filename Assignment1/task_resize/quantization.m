function qt_im = quantization(org_im,qt_factor)
% org_im: Input original image  
% qt_factor: Input the power of desired quantization level
% qt_im: Output quantized image

new_lv=uint8(2^qt_factor);    % Obtain number of levels     
qt_im=(org_im/new_lv)*new_lv; % Get quantized integers and map back
end