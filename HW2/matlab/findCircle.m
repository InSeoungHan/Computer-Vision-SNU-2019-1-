function [cx cy r] = findCircle(img, threshold)
    %make circle distict, then find centroid of circle and radius
    s = regionprops(img > threshold, 'Centroid', 'MajorAxisLength');
    cx = round(s.Centroid(1));
    cy = round(s.Centroid(2));
    r = round(s.MajorAxisLength);
    
