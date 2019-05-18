%init
clear ; close all; clc;

%load image and data
rect_img = imread('../data/HTC.png');
load('./points.mat')
p1 = Rp1;
p2 = Rp2;

%rectify & imshow and save result
[H, result] = rectify(rect_img, p1, p2);
imshow(result);
imwrite(result, '../result/HTC_rectified.png');