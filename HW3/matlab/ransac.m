function [line, inliers] = ransac(points, iter, thr, mininlier)
 psize = size(points, 2);
 inliers = zeros(psize, 1);
 line = [0 0];
 GoodFit = 0;
 %start iteration

 for k = (1:iter)
     fprintf("iter %d\n", k);
     %temp variable to hold inliers in each iteration
     temp = zeros(psize, 1);
     
     %Randomly select minimal subset of points
     ri = randi(psize);
     rj = randi(psize);
     while(ri == rj)
         rj = randi(psize);
     end
     randp1 = points(:, ri);
     randp2 = points(:, rj);
     
     %calculate the slope of hypothesis of two random points
     slope = (randp1 - randp2)/norm(randp1 - randp2);
     
     %calculate inliers
     for i=(1:psize)
         target = (points(:, i) - randp1);
         distance = norm(target - sum(slope .* target) * slope);
         if(distance <= thr)
             temp(i) = 1;
         end
     end
     
     s = sum(temp);
     %if the number of inliers in each iteration is bigger than
     %'mininlier' then add one to GoodFit
     if(s > mininlier)
         GoodFit = GoodFit + 1;
     end
     
     % if the number of in some iteration is bigger than max inliers at
     % that time, update the result, and plot
     if(s > sum(inliers))
        inliers = temp;
     end
     
    %draw original point & inliers & line
    inlier_point = points(:, temp > 0);
    %line is hypothesis of all inliers
    line = polyfit(inlier_point(1, :), inlier_point(2, :), 1);
    r = (min(points(1, :)) - randp1(1)) / slope(1);
    t = (max(points(1, :)) - randp1(1)) / slope(1);
    static_points = [randp1 + r * slope, randp1 + t * slope]; 
    figure;
    scatter(points(1, :), points(2, :));
    hold on;
    plot(static_points(1, :), static_points(2, :));
    scatter(inlier_point(1, :), inlier_point(2, :), 'MarkerFaceColor',[0 .7 .7]);
     title("best hypothesis during " + k + "th iteration, inliers : " + sum(temp) + ", # of Good Fit : " + GoodFit);
     pause;
 end
 
end
 
 