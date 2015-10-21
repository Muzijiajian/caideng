function p = feedforward(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%
%   Input:  Theta1 -- weights between input-hidden layers, 401x25 matrix
%           Theta2 -- weights between hidden-output layers, 26x10 matrix
%                X -- test set, 400xP matrix, P is size of testing set
%
%   Output: p -- predicted labels, 1xP row vector

% Note:
% The matrix X contains the examples in columns.
% The matrices Theta1 and Theta2 contain the parameters for each unit in
% column. Specifically, the first column of Theta1 corresponds to the first
% hidden unit in the second layer.

% YOUR CODE HERE
[~,m] = size(X);
X = [ones(m,1)';X];
hidden_one = sigmoid( X'*Theta1 );
hidden_one = [ones(m,1)';hidden_one'];
[~,p] = max( sigmoid(hidden_one'*Theta2)' );
end
