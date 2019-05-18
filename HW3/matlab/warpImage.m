function [Iwarp, Imerge] = warpImage(Iin, Iref, H)
%Given input image, reference image, H
%warp Iin according to H, and merge it to Iref
    [ySize, xSize, zSize] = size(Iin);
    %transform cornerpoints in Iin to get the size of warped image
    cornerPoints = H * [1 xSize 1 xSize; 1 1 ySize ySize; 1 1 1 1];
    for i=1:4
        cornerPoints(:,i) = cornerPoints(:,i)/cornerPoints(3,i);
    end
    maxPoints = round(max(cornerPoints, [], 2));
    minPoints = round(min(cornerPoints, [], 2));
    %size of warped image
    xWsize = maxPoints(1) - minPoints(1);
    yWsize = maxPoints(2) - minPoints(2);
    zWsize = 3;
    Iwarp = zeros(yWsize,xWsize,zWsize);
    
    %size of merged image
    xMsize = max(xSize, maxPoints(1)) - min(0, minPoints(1));
    yMsize = max(ySize, maxPoints(2)) - min(0, minPoints(2));
    zMsize = 3;
    
    %inverse warping, interpolation is just solved by 'round' function
    for i=1:xWsize
        for j=1:yWsize
            invHPoint = pinv(H)*[i + minPoints(1) ; j + minPoints(2) ; 1];
            invHPoint = invHPoint/invHPoint(3);
            invHPoint = round(invHPoint(1:2));
            if(invHPoint(1) < 1 || invHPoint(1) > xSize || invHPoint(2) < 1 || invHPoint(2) > ySize)
                Iwarp(j, i, :) = 0;
            else
                Iwarp(j, i, :) = Iin(invHPoint(2), invHPoint(1), :);
            end
        end
    end
    
    %merge two image(warped image, Iref)
    Imerge = zeros(yMsize,xMsize,zMsize);
    tempx = minPoints(1);
    tempy = minPoints(2);
    for i=1:xWsize
        for j=1:yWsize
            if minPoints(2) < 0
                tempy = 0;
            end
            if minPoints(1) < 0
                tempx = 0;
            end
            Imerge(j+tempy, i+tempx, :) = Iwarp(j, i, :);
        end
    end
    
    tempx = minPoints(1);
    tempy = minPoints(2);
    for i=1:xSize
        for j=1:ySize
            if minPoints(2) >= 0
                tempy = 0;
            end
            if minPoints(1) >= 0
                tempx = 0;
            end
            Imerge(j-tempy, i-tempx, :) = Iref(j, i, :);
        end
    end
    
    %translate type of two result images from double to uint8 so that It
    %can be used as argument of 'imshow'
    Iwarp = uint8(Iwarp);
    Imerge = uint8(Imerge); 
end