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
    % �����L��ǰKС������ֵ�����Ӧ������������ע����С���Ǹ�����ֵһ����0�Ҷ�Ӧ����������Ϊ
    % Q������������V������ֵ
    % opt = struct('issym', true, 'isreal', true);
    [Q, ~] = eigs(L, D, k,'SM');  % (D-W)y = lambadaDy
    % ����K��������������µľ���������Ϊ������������ΪK
    % ʹ��K-Means�㷨���о��࣬�õ�K��Cluster
    idx = kmeans(Q, k);

end
