function W = knn_graph(X, k, threshold)
%KNN_GRAPH Construct W using KNN graph
%   Input: X - data point features, n-by-p maxtirx.
%          k - number of nn.
%          threshold - distance threshold.
%
%   Output:W - adjacency matrix, n-by-n matrix.

% YOUR CODE HERE
    % �˴�Ĭ��Ϊ2-2�ڽӾ���
    % ���ĳһ���㵽���е�֮��ľ���,ע����������ľ���Ϊ��
    D = pdist2(X,X,'euclidean');
    % �����Ǿ���С��threshold�ĵ���Ϊ1����ʾ������֮��������
    [m,n] = size(D);
    W = zeros(m,n);
    for i=1:m
        tmp_line = D(i,:);
        [~,sort_idx] = sort(tmp_line);
        idx = sort_idx(1:k);
        % ȡǰk��������ڵ��Լ�С��threshold�ı��Ϊ1
        for j=1:k
            if D(i,idx(j)) < threshold
                W(i,idx(j)) = 1;
                W(idx(j),i) = 1;
            end
        end
    end
end
