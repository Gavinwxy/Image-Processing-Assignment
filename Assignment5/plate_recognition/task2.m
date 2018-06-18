im_plate = imread('car_license_plate.png');
im_alpha = imread('alphanumeric_templates.png');

lic_preds = detect_car_license_plate_v2(im_plate,im_alpha);
%lic_preds = detect_car_license_plate_v1(im_plate,im_alpha);
fprintf('Car licence plate is ку%s',lic_preds);