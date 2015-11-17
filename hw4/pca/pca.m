function [eigvector, eigvalue] = pca(data)
%PCA	Principal Component Analysis
%
%             Input:
%               data       - Data matrix. Each row vector of fea is a data point.
%               options    - 选取前k个特征向量进行计算相应特征值，从大到小
%             Output:
%               eigvector - Each column is an embedding function, for a new
%                           data point (row vector) x,  y = x*eigvector
%                           will be the embedding result of x.
%               eigvalue  - The sorted eigvalue of PCA eigen-problem.
%

    % YOUR CODE HERE
    % pre-process the data to normalize its mean and variance
    % can be ommited if data is already did this
    data = feature_preprocess(data);
    % calculate the covirance matrix S
    S = cov(data);
    row = size(data,1);     % 到底是要取行还是列进行计算特征向量？
    % calculate eigvector and eigvalue
    [eigvector,eigvalue] = eigs(S,row,'LM');
    eigvalue=sum(eigvalue,1);
end