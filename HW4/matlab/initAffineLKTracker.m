function [affineLKContext] = initAffineLKTracker(img, msk)
    [Y, X] = size(img);
    imgMasked = img .* msk;
    [Gx,Gy] = imgradientxy(imgMasked);
    deltaT = [Gx(:) Gy(:)];
    G = zeros(X * Y, 6);
    for i=1:X
        for j=1:Y
            G(Y * (i-1) + j, :) = deltaT(Y * (i-1) + j, :) * [i 0 j 0 1 0; 0 i 0 j 0 1];
        end
    end
    invH = inv(G' * G);
    affineLKContext = struct('Jacobian', G, 'HessianInv', invH, 'Exception', false);
end