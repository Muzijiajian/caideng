function w = linear_regression(X, y,num_iters)
%LINEAR_REGRESSION Linear Regression.
%
%   INPUT:  X: training sample features, P-by-N matrix.
%           y: training sample labels, 1-by-N row vector.
%
%   OUTPUT: w:    learned perceptron parameters, (P+1)-by-1 column vector.
%

% YOUR CODE HERE
w = zeros(size(X,1),1);
m = length(y);  % ��ȡ��������
alpha = 0.1;    % ��Ϊ�ݶ��½���ѧϰ����
tmpcost = 0;
minCost = Inf;
for i=1:num_iters
    tmpcost = calcuCost(X,y,w);
    h = w'*X;
    diff_v = h-y;
    w_change = 1/m*alpha*(diff_v*X');
    w = w - w_change';
    if tmpcost < minCost
        minCost = tmpcost;
    else
        break;
    end
end
w = [w;ones(1,1)];
end
