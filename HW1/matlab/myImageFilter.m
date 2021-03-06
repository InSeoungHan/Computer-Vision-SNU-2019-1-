function [image_conv] = myImageFilter(image, filter)
    [is_r, is_c] = size(image);
    [fs_r, fs_c] = size(filter);
    fliped_filter = fliplr(flipud(filter));
    %circular padding
    pad_rsize = floor((fs_r - 1)/2);
    padded_image = [image([pad_rsize:-1:1], :) ; image ; image([is_r:-1:(is_r - pad_rsize + 1)], :)];
    pad_csize = floor((fs_c - 1)/2);
    padded_image = [padded_image(:, [pad_csize:-1:1]) padded_image padded_image(:, [is_c:-1:(is_c - pad_csize + 1)])];
    image_conv = zeros(is_r, is_c);
    for i = 1:is_r
        for j = 1:is_c
            for m = 1:fs_r
                for n = 1:fs_c
                    image_conv(i, j) = image_conv(i, j) + fliped_filter(m, n) * padded_image(i + m - 1, j + n - 1);
                end
            end
        end
    end
end

                  
                      
                
                    
            