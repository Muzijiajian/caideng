function g = sigmoid(z)
%SIGMOID Compute sigmoid functoon
%   J = SIGMOID(z) computes the sigmoid of z.

% YOUR CODE HERE
g = 1.0 ./ (1 + exp(-z));

end
