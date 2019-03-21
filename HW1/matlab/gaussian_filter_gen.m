function [filter] = gaussian_filter_gen(size, sigma);
    center = (size + 1)/2;
    filter = exp(-([1:size] - center).^2.0 / (2.0 * sigma^2.0)) / sqrt(2.0*pi*sigma^2.0);
    %filter = filter' * filter;
end