function [image_conv] = myLaplacianFilter(image)
    lafilter = [0 1 0; 1 -4 1; 0 1 0] * 10;
    image_conv = myImageFilter(image, lafilter);
    
end