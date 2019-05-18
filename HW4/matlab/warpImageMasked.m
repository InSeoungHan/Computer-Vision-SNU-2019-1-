function [img_warped] = warpImageMasked(img, mask, W)
    img_warped = warpImage(img .* mask, W);
end