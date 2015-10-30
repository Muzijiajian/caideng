function W = knn_graph(X, k, threshold)
%KNN_GRAPH Construct W using KNN graph
%   Input: X - data point features, n-by-p maxtirx.
%          k - number of nn.
%          threshold - distance threshold.
%
%   Output:W - adjacency matrix, n-by-n matrix.

% YOUR CODE HERE
    % 此处默认为2-2邻接矩阵
    % 求出某一个点到所有点之间的距离,注意自身到自身的距离为零
    D = pdist2(X,X,'euclidean');
    % 将凡是距离小于threshold的点标记为1，表示两个点之间是相邻
    [m,n] = size(D);
    W = zeros(m,n);
    for i=1:m
        tmp_line = D(i,:);
        [~,sort_idx] = sort(tmp_line);
        idx = sort_idx(1:k);
        % 取前k个最近相邻点以及小于threshold的标记为1
        for j=1:k
            if D(i,idx(j)) < threshold
                W(i,idx(j)) = 1;
                W(idx(j),i) = 1;
            end
        end
    end
end
