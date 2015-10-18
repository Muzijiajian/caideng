function w = logistic(X, y,num_iters)
%LR Logistic Regression.
%
%   INPUT:  X:   training sample features, P-by-N matrix.
%           y:   training sample labels, 1-by-N row vector.
%
%   OUTPUT: w    : learned parameters, (P+1)-by-1 column vector.
%

% YOUR CODE HERE
    w = zeros(size(X,1),1);
    m = length(y);
    tmpcost = 0;
    minCost = Inf;
for i=1:num_iters
    tmpcost = logistic_regression(w,X,y);
    grad = 1/m .* (sigmod(X'*w)'-y) * X';
    w = w - grad';
    if tmpcost < minCost
        minCost = tmpcost;
    else
        break;
    end
end
w = [w;ones(1,1)];
end
