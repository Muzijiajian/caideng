load('digit_data', 'X', 'y');
load('weights', 'Theta1', 'Theta2');

p = feedforward(Theta1, Theta2, X);
fprintf('Error rate for NN is %f.\n', length(find(p ~= y))/length(p));

train_X = X(:, 1:2500);
train_y = y(1:2500);
test_X = X(:, 2501:end);
test_y = y(2501:end);
% computer training error and test error
p_train = feedforward(Theta1, Theta2, train_X);
p_test = feedforward(Theta1, Theta2, test_X);
fprintf('Error rate for train is %f and error rate for test is %f.\n', ...
    length(find(p_train ~= train_y))/length(train_y),length(find(p_test ~= test_y))/length(test_y));
% YOUR CODE HERE
% Trainning and testing using one-vs-all with LIBLINEAR
w = one_vs_all(train_X,train_y);
[~,nn_p_train] = max(w*train_X);
[~,nn_p_test] = max(w*test_X);
fprintf('Error rate using one vs all within libsvm for train is %f and error rate for test is %f.\n', ...
    sum(nn_p_train ~= train_y)/length(train_y),length(find(nn_p_test ~= test_y))/length(test_y));