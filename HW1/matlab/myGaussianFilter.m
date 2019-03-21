function [image_conv] = myGaussianFilter(image, sigma)
    kernel = gaussian_filter_gen(5, sigma);
    image_conv = myImageFilter(image, kernel);
    image_conv = myImageFilter(image_conv, kernel');
    
end