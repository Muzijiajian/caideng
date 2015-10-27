function [idx, ctrs, iter_ctrs] = kmeans(X, K)
%KMEANS K-Means clustering algorithm
%
%   Input: X - data point features, n-by-p maxtirx.
%          K - the number of clusters
%
%   OUTPUT: idx  - cluster label
%           ctrs - cluster centers, K-by-p matrix.
%           iter_ctrs - cluster centers of each iteration, K-by-p-by-iter
%                       3D matrix.

% YOUR CODE HERE
    idx = zeros(size(X,1),1);   % n*1 lables 
    % Randomly reorder the indices of examples
    randidx = randperm(size(X, 1));
    % Take the first K examples as centroids
    ctrs = X(randidx(1:K), :);
    iter = 1;
    iter_ctrs(:,:,iter) = ctrs;
    while 1
        judge_idx = idx;
        iter = iter+1;
        % calculate distance between each point and each cluster centers
        for i=1:size(X,1)
            x = X(i,:); % Get one sample in X
            distance_min = Inf;
            % Calculate distance between current sample and each cluster center
            for j=1:K
                mu = ctrs(j,:);
                tmp_dis = (x-mu)*(x-mu)';
                % Find the closest cluster center for current sample
                if tmp_dis < distance_min
                    distance_min = tmp_dis;
                    idx(i) = j;
                end
            end
        end
        % Based on new idx, update the cluster center
        for i=1:K
            % find all samples that in one cluster
            tmp_center_idx = find(idx==i);
            len = length(tmp_center_idx);
            % sum all samples and get new cluster center
            total = zeros(1,size(X,2));
            for j=1:len
                % 特别注意这里是j，数据一多才发现之前写的是tmp_center_idx(i)
                tmp_X = X( tmp_center_idx(j),: );
                total = total+tmp_X;
            end
            ctrs(i,:) = total ./ len;
        end        
        % Save each step center and Stop condition
        iter_ctrs(:,:,iter) = ctrs;
        if sum(judge_idx==idx) == size(X,1)
            break;
        end
        if iter==30
            break;
        end    
    end

end
