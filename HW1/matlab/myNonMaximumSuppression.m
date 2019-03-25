function [In] = myNonMaximumSuppression(Im, Io)
    [h, w] = size(Im);
    In = Im;
    for i=1:h
        for j=1:w
            [temp1, temp2] = orient_unit_vector(Io(i,j));
            temp1 = max([1 1], min([h w],(temp1 + [i j])));
            temp2 = max([1 1], min([h w],(temp2 + [i j])));
            if Im(i,j) < Im(temp1(1), temp1(2)) || Im(i,j) < Im(temp2(1), temp2(2))
                In(i,j) = 0;
            end
            
        end
    end
    
    function [v1, v2] = orient_unit_vector(degree)
        if (degree > 67.5 || degree < -67.5)
            v1 = [1 0];
            v2 = [-1 0];
        elseif(degree > 22.5)
            v1 = [1 1];
            v2 = [-1 -1];
        elseif(degree < -22.5)
            v1 = [-1 1];
            v2 = [1 -1];
        else
            v1 = [0 1];
            v2 = [0 -1];
        end
    end
end