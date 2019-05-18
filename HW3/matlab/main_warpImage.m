%init
clear ; close all; clc;

%load image and data
img = imread('../data/taj1r.png');
ref = imread('../data/taj2r.png');
load('./points.mat')
p1 = Wp1;
p2 = Wp2;

%compute homography matrix for input to warpImage
H = computeH(p1, p2);

%do warpImage & imshow and save results
[Iwarp, Imerge] = warpImage(img, ref, H);
imwrite(Iwarp, '../result/taj1r_warped.png');
imwrite(Imerge, '../result/taj2r_merged.png');

imshow(Iwarp);
pause;
imshow(Imerge);