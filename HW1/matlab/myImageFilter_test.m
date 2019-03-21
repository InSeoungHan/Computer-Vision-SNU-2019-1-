function myImageFilter_test(img, filter)
    fprintf("this is myImageFilter test!\n");
    [h, w] = size(img);  
    fprintf("image size: %d x %d\n", w, h);
    test = myImageFilter(img, filter);
    
    [fs_r, fs_c] = size(filter);
    answer = conv2(padarray(img, [floor(fs_r/2) floor(fs_c/2)], 'symmetric'), filter, 'valid');
    
    if (h * w) == sum(sum(round(test,4) == round(answer,4)))
        fprintf("your convolution function is correct!\n");
    else
        fprintf("there are some mismatches bewteen answer and your code. your convolution function is wrong!\n");
    end
end