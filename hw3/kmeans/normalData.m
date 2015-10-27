function X_val = normalData(X)
% 对输入数据进行归一化处理   
% Input:  X--  n*p,n is the number of samples and p is features
% Output: X_val 
    X_val = X;
    % calculate the mean of data
    mu = mean(X,1);
    % calculate the covariance of data
    sigma = var(X);
    % do the normalization
    for i=1:size(X,1)
        X_val(i,:) = (X(i,:)-mu) ./ sigma;
    end
end