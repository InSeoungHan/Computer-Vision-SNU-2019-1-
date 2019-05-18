%init
clear ; close all; clc;


%%%%%%%%%% ransac %%%%%%%%%%
%building argument for ransac
iter = 6;
thr = 0.1;
mininlier = 50;
interval = linspace(-1, 1, 100);
X = interval + normrnd(0, 0.1, 1, 100); 
Y = interval + normrnd(0, 0.1, 1, 100);

%do ransac
[line, inliers] = ransac([X ; Y], iter, thr, mininlier);



