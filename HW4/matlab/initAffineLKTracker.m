function [affineLKContext] = initAffineLKTracker(img, msk)
% compute G, inverse H and save those in struct
    %cut it for using only msk size
    imgMasked = img(msk > 0);
    [idy, idx] = find(msk > 0);
    Y = max(idy) - min(idy) + 1;
    X = max(idx) - min(idx) + 1;
    imgMasked = reshape(imgMasked, Y, X);
    [Gx,Gy] = imgradientxy(imgMasked);
    deltaT = [Gx(:) Gy(:)];
    G = zeros(X * Y, 6);
    
    %iterate for all points and construct G
    for i=1:X
        for j=1:Y
            G(Y * (i-1) + j, :) = deltaT(Y * (i-1) + j, :) * [i 0 j 0 1 0; 0 i 0 j 0 1];
        end
    end
    
    %getting inverse of H
    invH = inv(G' * G);
    
    %save
    affineLKContext = struct('Jacobian', G, 'HessianInv', invH, 'Exception', false);
end