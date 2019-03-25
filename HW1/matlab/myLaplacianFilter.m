function [image_conv] = myLaplacianFilter(image)
    lafilter = [1 1 1; 1 -8 1; 1 1 1];
    image_conv = myImageFilter(image, lafilter);
    
end