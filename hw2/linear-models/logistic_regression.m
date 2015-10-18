function J = logistic_regression(theta,X,y)
% LOGISTIC_REGRESSION Compute cost for logistic regression
%   INPUT:  theta:  the weights before each x
%           X:      training sample features, P-by-N matrix.
%           y:      training sample labels, 1-by-N row vector.
%
%   OUTPUT: J:    Current cost of using theta

    m = length(y); % number of training examples
    J = 1/m * (sum( -y' .* log(sigmod(X'*theta)) - (1-y)' .* log(1-sigmod(X'*theta))));
end