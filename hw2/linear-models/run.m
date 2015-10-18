 % You can use this skeleton or write your own.
% You are __STRONGLY__ suggest to run this script section-by-section using Ctrl+Enter.
% See http://www.mathworks.cn/cn/help/matlab/matlab_prog/run-sections-of-programs.html for more details.
%% Part1: Preceptron
nRep = 1000; % number of replicates
nTrain = 100; % number of training data
error_rate_1 = 0.0;% 自己定义的Part One的误分类率
sum_iter = 0;
for i = 1:nRep
    [X, y, w_f] = mkdata(nTrain);
    [w_g, iter] = perceptron(X, y);
    % Compute training, testing error
    error_rate = errorrate(X,w_g,y);
    error_rate_1 = error_rate_1+error_rate;
    % Sum up number of iterations
    sum_iter = sum_iter+iter; 
end
% 展示训练数据集的error
error_rate_1 = error_rate_1/ nRep;
aver_iter = 1.0*sum_iter/nRep;
fprintf('The the average number of iterations is %d in %d training samples.\n',aver_iter,nTrain);
fprintf('The training error of %.2d training samples are: %.2d\n',nTrain,error_rate_1);
% 展示根据测试数据集得出的权值w计算得到的error
test_error_1 = testDataPart(10,w_g);
fprintf('The test error of 10 test samples are: %.2d\n',test_error_1);
%fprintf('E_train is %f, E_test is %f.\n', E_train, E_test);
%fprintf('Average number of iterations is %d.\n', avgIter);
%plotdata(X, y, w_f, w_g, 'Pecertron');

%% Part2: Preceptron: Non-linearly separable case
nTrain = 100; % number of training data
error_rate_2 = 0.0;% 自己定义的Part Two的误分类率
[X, y, w_f] = mkdata(nTrain, 'noisy');
[w_g, noise_iter] = perceptron(X, y);
error_rate_noisy = errorrate(X,w_g,y);
fprintf('The average number of iterations is %d in %d training samples.\n',noise_iter,nTrain);
fprintf('The training error of %.2d training samples are: %.2d\n',nTrain,error_rate_noisy);
plotdata(X, y, w_f, w_g, 'Pecertron: noisy');

%% Part3: Linear Regression
nRep = 1000; % number of replicates
nTrain = 100; % number of training data
error_rate_3 = 0.0;
for i = 1:nRep
    [X, y, w_f] = mkdata(nTrain);
    w_g = linear_regression(X, y,150);
    % Compute training, testing error
    error_rate = errorrate(X,w_g,y);
    error_rate_3 = error_rate_3+error_rate;
end
error_rate_3 = error_rate_3/ nRep;
test_error_3 = testDataPart(20,w_g);
fprintf('The training error of %.2d training samples are: %.2d\n',nTrain,error_rate_3);
fprintf('The test error of 20 test samples are: %.2d\n',test_error_3);
%fprintf('E_train is %f, E_test is %f.\n', E_train, E_test);
plotdata(X, y, w_f, w_g, 'Linear Regression');

%% Part4: Linear Regression: noisy
nRep = 1000; % number of replicates
nTrain = 100; % number of training data
error_rate_4 = 0.0;
for i = 1:nRep
    [X, y, w_f] = mkdata(nTrain, 'noisy');
    w_g = linear_regression(X, y,150);
    % Compute training, testing error
    error_rate = errorrate(X,w_g,y);
    error_rate_4 = error_rate_4+error_rate;
end
error_rate_4 = error_rate_4/ nRep;
test_error_4 = testDataPart(20,w_g);
fprintf('The training error of %.2d training samples with noises are: %.2d\n',nTrain,error_rate_4);
fprintf('The test error of 20 test samples with noises are: %.2d\n',test_error_4);
%fprintf('E_train is %f, E_test is %f.\n', E_train, E_test);
plotdata(X, y, w_f, w_g, 'Linear Regression: noisy');

%% Part5: Linear Regression: poly_fit
load('poly_train', 'X', 'y');
load('poly_test', 'X_test', 'y_test');
w = linear_regression(X, y,150);
% Compute training, testing error
error_rate_train = errorrate(X,w,y);
error_rate_test = errorrate(X_test,w,y_test);
fprintf('E_train is %f, E_test is %f.\n', error_rate_train,error_rate_test);

% poly_fit with transform
% CHANGE THIS LINE TO DO TRANSFORMATION
X_t = [X;X(1,:).*X(2,:);X(1,:).*X(1,:);X(2,:).*X(2,:)];
w_g_t = linear_regression(X_t, y,150);
% CHANGE THIS LINE TO DO TRANSFORMATION
X_test_t = [X_test;X_test(1,:).*X_test(2,:);X_test(1,:).*X_test(1,:);X_test(2,:).*X_test(2,:)]; 
% Compute training, testing error
error_rate_train = errorrate(X_t,w_g_t,y);
error_rate_test = errorrate(X_test_t,w_g_t,y_test);
fprintf('E_train is %f, E_test is %f.\n', error_rate_train,error_rate_test);

%% Part6: Logistic Regression
nRep = 100; % number of replicates
nTrain = 100; % number of training data
error_rate_6 = 0.0;
for i = 1:nRep
    [X, y, w_f] = mkdata(nTrain);
    w_g = logistic(X, y,150);
    error_rate = errorrate(X,w_g,y);
    % Compute training, testing error
    error_rate_6 = error_rate_6+error_rate;
end
error_rate_6 = error_rate_6/ nRep;
test_error_6 = testDataPart(20,w_g);
fprintf('The training error of %.2d training samples are: %.2d\n',nTrain,error_rate_6);
fprintf('The test error of 20 test samples are: %.2d\n',test_error_6);
%fprintf('E_train is %f, E_test is %f.\n', E_train, E_test);
plotdata(X, y, w_f, w_g, 'Logistic Regression');

%% Part7: Logistic Regression: noisy
nRep = 100; % number of replicates
nTrain = 100; % number of training data
nTest = 10000; % number of training data
error_rate_7 = 0.0;
for i = 1:nRep
    [X, y, w_f] = mkdata(nTrain, 'noisy');
    w_g = logistic(X, y,150);
    error_rate = errorrate(X,w_g,y);
    % Compute training, testing error
    error_rate_7 = error_rate_7+error_rate;
end
error_rate_7 = error_rate_7/ nRep;
test_error_7 = testDataPart(20,w_g);
fprintf('The training error of %.2d training samples with noises are: %.2d\n',nTrain,error_rate_7);
fprintf('The test error of 20 test samples with noises are: %.2d\n',test_error_7);
%fprintf('E_train is %f, E_test is %f.\n', E_train, E_test);
plotdata(X, y, w_f, w_g, 'Logistic Regression: noisy');

%% Part8: SVM
nRep = 1000; % number of replicates
nTrain = 100; % number of training data
error_rate_8 = 0;
sum_vector = 0;
for i = 1:nRep
    [X, y, w_f] = mkdata(nTrain);
    [w_g, num_sc] = svm(X, y);
    % Compute training, testing error
    error_rate = errorrate(X,w_g,y);
    error_rate_8 = error_rate_8+error_rate;
    % Sum up number of support vectors
    sum_vector = sum_vector+num_sc;
end
error_rate_8 = error_rate_8/ nRep;
aver_vector = 1.0*sum_vector/nRep;
fprintf('The the average number of support vector is %d in %d training samples.\n',aver_vector,nTrain);
fprintf('The training error of %.2d training samples are: %.2d.\n',nTrain,error_rate_8);
%fprintf('E_train is %f, E_test is %f.\n', E_train, E_test);
test_error_8 = testDataPart(10,w_g);
fprintf('The test error of 10 test samples are: %.2d.\n',test_error_8);
plotdata(X, y, w_f, w_g, 'SVM');


