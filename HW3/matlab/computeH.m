function H = computeH(p1, p2)
    N = size(p1, 2);
    A = zeros(2*N, 9);
    for i=(1:N)
        A(2*i-1:2*i, :) = [p2(1, i) p2(2,i) 1 0 0 0 -p1(1,i)*p2(1,i) -p1(1,i)*p2(2,i) -p1(1,i);
                            0 0 0 p2(1,i) p2(2,i) 1 -p2(1, i)*p1(2,i) -p2(2,i)*p1(2,i) -p1(2,i)];
    end
    [U, S, V] = svd(A);
    H = reshape(V(:, end), 3, 3)';
    
end