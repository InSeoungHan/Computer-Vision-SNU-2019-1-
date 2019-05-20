function [img_warped] = warpImageMasked(img, mask, W)
%based on warpImage.m, generate warpImageMasked
    [R, C, D] = size(img);

    % get size of matrix
    warpim = zeros([R, C, D]);

    % compute mask points in the warped image
    [wY, wX] = find(mask);
    allwp = [wX(:)' ; wY(:)' ; ones(1, numel(wX))];

    alluwp = W \ allwp;

    % compute the inverse warped positions in the original image
    alluwp(1,:) = alluwp(1,:) ./ alluwp(3,:);
    alluwp(2,:) = alluwp(2,:) ./ alluwp(3,:);

    % compute the image values for each dimension
    j = find(mask);
    for i = 1:D
        warpimi = interp2(img(:,:,i),alluwp(1,:),alluwp(2,:),'nearest',-1e6);
        warpim(j + (i-1)*R*C) = warpimi;
    end
    img_warped = warpim;
end