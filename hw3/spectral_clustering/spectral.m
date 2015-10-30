function idx = spectral(W, k)
%SPECTRUAL spectral clustering
%   Input:
%     W: Adjacency matrix, N-by-N matrix, it is equals to matrix A(Affinity matrix)
%     k: number of clusters
%   Output:
%     idx: data point cluster labels, n-by-1 vector.

% YOUR CODE HERE
    % D is diagonal whose(i,i) is the sum of A's i-th row
    D = diag(sum(W));
    % construct Laplacian matrix, make sure L is still a symmetic matrix
    L = D-W;
    % 求矩阵L的前K小个特征值及其对应的特征向量，注意最小的那个特征值一定是0且对应的特征向量为
    % Q是特征向量，V是特征值
    % opt = struct('issym', true, 'isreal', true);
    [Q, ~] = eigs(L, D, k,'SM');  % (D-W)y = lambadaDy
    % 以这K组特征向量组成新的矩阵，其行数为样本数，列数为K
    % 使用K-Means算法进行聚类，得到K个Cluster
    idx = kmeans(Q, k);

end
