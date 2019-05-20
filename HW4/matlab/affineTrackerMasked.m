function Wout = affineTrackerMasked(img, tmp, mask, W, context, Iter)
% Function to get next Warping matrix.
%
% ============================ Inputs ============================
% img - input image
%   A greyscale or color image (2D or 3D matrix), should be double not integer.
% tmp - template image
% mask - true/false matrix with the same size as tmp
% W - previous Warping matrix
% context - pre-computed Jacobain matrix & inverse Hessian 
% Iter - the maximum number of iteration to find best delta p
% ============================ Outputs ============================
% Wout - next Warping matrix
J = context.Jacobian';
H = context.HessianInv;
tmp = tmp(mask > 0);
for i=1:Iter
    warpedImg = warpImageMasked(img, mask, W);
    warpedImg = warpedImg(mask > 0);
    error = warpedImg - tmp;
    deltaP = H * (J * error);
    Wp = [1+deltaP(1) deltaP(3) deltaP(5); deltaP(2) 1+deltaP(4) deltaP(6); 0 0 1]; %construct W(x; delta p)
    W = W * Wp; %update Warp matrix
end
Wout = W;
end
