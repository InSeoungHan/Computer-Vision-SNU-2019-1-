%initAffineLKTracker test
clear;
load('../data/initTest.mat');
A = affineLKContext.HessianInv;
B = affineLKContext.Jacobian;
myContext = initAffineLKTracker(img, ones(80));
a = myContext.HessianInv;
b = myContext.Jacobian;
fprintf("HessianInv accuracy : %d%%\n", sum(sum(a == A)) / (sum(sum(a ~= A)) + sum(sum(a == A))));
disp(a);