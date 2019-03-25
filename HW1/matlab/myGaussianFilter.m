function [image_conv] = myGaussianFilter(image, sigma)
    kernel = gaussian_filter_gen(15, sigma);
    image_conv = myImageFilter(image, kernel' * kernel);
    %image_conv = myImageFilter(image_conv, kernel);
    
end