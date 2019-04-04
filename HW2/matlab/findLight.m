function lv = findLight(img, cx, cy, r)
    %find 1d-index for the brightest point
    [M, I] = max(img(:));
    %translate 1d-index to 2d-point
    [cv, cu] = ind2sub(size(img), I);
    %find normal vector
    lv = [(cu - cx); (cv - cy); sqrt(r^2 - (cu - cx)^2 - (cv -cy)^2)];
    %set the norm of the normal vector to M
    lv = lv/norm(lv) * M;