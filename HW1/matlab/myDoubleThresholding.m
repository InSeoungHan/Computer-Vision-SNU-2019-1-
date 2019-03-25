function [Iedge] = myDoubleThreshoulding(In, Th, Tl)

    [h, w] = size(In);        

    Iedge = zeros(h, w);
    
    In = padarray(In, [1 1]);
    for i=1:h
        for j=1:w
            if In(i+1,j+1) > Th
                Iedge(i,j) = 1; 
            elseif In(i+1,j+1) > Tl
                Iedge(i,j) = 0.5;
                for m=-1:1
                    for n=-1:1
                        if In(i+m+1, j+n+1) > Th
                           Iedge(i,j) = 1; 
                        end
                    end
                end
            end
        end
    end
    
           
    %{
    %strong_edge
    SE = (In - Th) > 0;
    %strong + candidate edge
    Iedge = (In - Tl) > 0;
    %candidate points
    [x, y] = find(Iedge - SE);
    for point = [x'; y']
        lu = max([1;1],point-1); 
        rd = min([h;w],point+1);
        Iedge(point(1), point(2)) = min(Iedge(point(1), point(2)), sum(sum(SE(lu(1):rd(1), lu(2):rd(2)))));
    end
    %}
    
end