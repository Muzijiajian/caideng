function J = calcuCost(X, y, theta)
%Compute cost for linear regression with multiple variables
%
%   INPUT:  X:      training sample features, P-by-N matrix.
%           y:      training sample labels, 1-by-N row vector.
%           theta:  the weights before each x
%
%   OUTPUT: J:      Current cost of using theta
%
    m = length(y); % number of training examples
    J = 1.0/(2*m) * sum( (theta'*X - y).^2 );
end