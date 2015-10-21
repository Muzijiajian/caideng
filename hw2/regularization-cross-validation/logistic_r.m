function w = logistic_r(X, y, lambda)
%LR Logistic Regression.
%
%   INPUT:  X:   training sample features, P-by-N matrix.
%           y:   training sample labels, 1-by-N row vector.
%           lambda: regularization parameter.
%
%   OUTPUT: w    : learned parameters, (P+1)-by-1 column vector.
%

% YOUR CODE HERE
    [n,m] = size(X);
    w = rand(n,1);
    J = 0;
    cost = 0;
    % 开始对w进行梯度下降算法
    alpha = 0.0005;    % 定义学习速率
    while 1
        J = cost;
        part_1 = -1*( y*log(sigmoid(w'*X))' + (1-y)*log(1-sigmoid(w'*X))' ) / m;
        regular_part = lambda/2/m*w'*w;
        cost = part_1 + regular_part;
        if  abs(cost-J) < 0.0001
            %J < 1e-5 && J > 0
            %J_min = J;
            break;
        else
            % 更新w和J的值
            tmp = w(1);     % 对于w的第一项没有惩罚项
            grad = alpha*( X*(sigmoid(w'*X)-y)'/m + lambda/m*w );
            w(1) = w(1) - lambda/m*tmp;
            w = w - grad;
        end
    end
end
