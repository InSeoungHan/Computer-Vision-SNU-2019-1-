function [H, result] = rectify(Img, p1, p2)
    H = computeH(p1, p2);
    
    %compute size of result image & initialize result
    maxPoints = max(p1, [], 2);
    minPoints = min(p1, [], 2);
    xSize = maxPoints(1) - minPoints(1);
    ySize = maxPoints(2) - minPoints(2);
    result = zeros(ySize, xSize, 3);
    
    %rectify by using inverse warping
    for i =1:xSize
        for j=1:ySize
            invHPoint = pinv(H)*[i; j; 1];
            invHPoint = invHPoint/invHPoint(3);
            invHPoint = round(invHPoint(1:2));
            result(j, i, :) = Img(invHPoint(2), invHPoint(1), :);
        end
    end
    
    %translate type of two result images from double to uint8 so that It
    %can be used as argument of 'imshow'
    result = uint8(result);
end