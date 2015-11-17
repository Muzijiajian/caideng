function [eigvector, eigvalue] = pca(data)
%PCA	Principal Component Analysis
%
%             Input:
%               data       - Data matrix. Each row vector of fea is a data point.
%               options    - ѡȡǰk�������������м�����Ӧ����ֵ���Ӵ�С
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
    row = size(data,1);     % ������Ҫȡ�л����н��м�������������
    % calculate eigvector and eigvalue
    [eigvector,eigvalue] = eigs(S,row,'LM');
    eigvalue=sum(eigvalue,1);
end