function Ikm = k_means(I,K) 

%% K-means Segmentation (option: K (Number of Clusters))
I = im2double(I);
F = reshape(I,size(I,1)*size(I,2),3);                 % Color Features
%% K-means
CENTS = F( ceil(rand(K,1)*size(F,1)) ,:);             % Cluster Centers
DAL   = zeros(size(F,1),K+2);                         % Distances and Labels
KMI   = 10;                                           % K-means Iteration

for n = 1:KMI    
    for i = 1:size(F,1)
        % Iterate over each pixels to compute distance from cluster centers
    end
	for i = 1:K
        % Re-locate cluster centroids
	end
end

X = zeros(size(F));
for i = 1:K
	idx = find(DAL(:,K+1) == i);
    X(idx,:) = repmat(CENTS(i,:),size(idx,1),1); 
end
Ikm = reshape(X,size(I,1),size(I,2),3);             % Segmented image

end
