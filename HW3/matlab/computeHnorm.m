function H = computeHnorm(p1, p2)
%this function just does normalization on p1 & p2 thne pass it to computeH
    N = size(p1, 2);
    A = zeros(2*N, 9);
    %mean normalization & scaling to [-1 1]
    p1 = normalize(p1, 2, 'center', 'mean');
    p1 = normalize(p1, 2, 'range', [-1 1]);
    p2 = normalize(p2, 2, 'center', 'mean');
    p2 = normalize(p2, 2, 'range', [-1 1]);
    H = computeH(p1, p2);
end