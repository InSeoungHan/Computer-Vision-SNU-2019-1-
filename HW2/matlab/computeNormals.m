function [normals albedo] = computeNormals(img1, img2, img3, lv1, lv2, lv3, threshold)
    [m, n] = size(img1);
    %initialize normals
    normals = zeros(3, m*n);
    albedo = zeros(m*n, 1);
    %for each pixel, compute normal and albedo by matrix equation
    %I set size(albedo) = N = m * n, size(normals) = 3 * N to reduce dimension
    for i=1:m
        for j=1:n
            %normal vector in the point of which max image value bigger then threshold is available
            if min([img1(i,j), img2(i,j), img3(i,j)]) >= threshold 
                normals(:, i + m*(j-1)) = pinv([lv1'; lv2'; lv3']/pi) * [img1(i,j); img2(i,j); img3(i,j)];
                albedo(i + m*(j-1)) = norm(normals(:, i + m*(j-1)));
                normals(:, i + m*(j-1)) = normals(:, i + m*(j-1))/albedo(i + m*(j-1));
            end
        end
    end
    %reshape two variables so that it could be 2d image.
    albedo = reshape(albedo, m, n);
    normals = reshape(normals, 3, m, n);