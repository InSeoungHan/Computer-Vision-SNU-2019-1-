function [globalImg directImg] = separateGlobalDirect(dirname)
    %get max and min RGB values in pixel among the 25 images
    for i =0:4
        for j=0:4
            imagelist(:,:,:,5*i + j + 1) = imread(sprintf('%s/shift_%d_%d.png', dirname, i, j));
            maxImg = max(imagelist, [], 4);
            minImg = min(imagelist, [], 4);
        end
    end
    %for alpha = 0.5, compute direct component, and global component
    globalImg = 2 * minImg;
    directImg = maxImg - minImg;