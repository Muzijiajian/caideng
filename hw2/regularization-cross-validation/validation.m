%% Ridge Regression
load('digit_train', 'X', 'y');

% Do feature normalization
% ���ݼ�ȥƽ��ֵ���Է���
m = length(y);  % ��ȡ������������
uX = mean(X);   % ����ƽ��ֵ
std_X = std(X);  % ���㷽��ֵ
for i=1:m
    X(:,i) = ( X(:,i) - uX(i) ) / std_X(i);
end
X = [ones(1,m);X];
% Do LOOCV
lambdas = [1e-3, 1e-2, 1e-1, 0, 1, 1e1, 1e2, 1e3];
lambda = 0;
minVal = inf;
% Compute test error
%...
for i = 1:length(lambdas)
    E_val = 0;
    for j = 1:size(X, 2)
        X_ = X(:,[1:j-1,j+1:end]); y_ = y(:,[1:j-1,j+1:end]); % take point j out of X
        w = ridge(X_, y_, lambdas(i));
        yesorno = ( sign( w' * X(:,j) ) ~= y(j) );
        E_val = E_val + yesorno;
    end
    % Update lambda according validation error
    if E_val < minVal
        minVal = E_val;
        lambda = lambdas(i);
    end
end
% Compute training error
w = ridge(X,y,lambda);
train_error = sum( sign(w'*X) ~= y ) / m;
load('digit_test', 'X_test', 'y_test');
m_test = length(y_test);
X_test = [ones(1,m_test);X_test];
test_error = sum( sign(w'*X_test) ~= y_test ) / m_test;
fprintf('E_train is %f, E_test is %f.\n', train_error, test_error);

%% Logistic
% Do feature normalization
% �����ر���Ҫע���y=-1��ֵ��Ϊ0
logistic_y = y;
idx = find(y==-1);
logistic_y(idx) = 0;
% �Լ��ȶ���һ������lambda��ֵ
min_cost = inf;
for i=1:length(lambdas)
    w = logistic_r(X, logistic_y, lambda);
    tmp_cost = -1*( logistic_y*log(sigmoid(w'*X))' + (1-logistic_y)*log(1-sigmoid(w'*X))' ) / m + lambda/2/m*w'*w;
    if tmp_cost < min_cost
       this_lam = lambdas(i);
       min_cost = tmp_cost;
    end
end
%% SVM with slack variable
