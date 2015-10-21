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
    % ��ʼ��w�����ݶ��½��㷨
    alpha = 0.0005;    % ����ѧϰ����
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
            % ����w��J��ֵ
            tmp = w(1);     % ����w�ĵ�һ��û�гͷ���
            grad = alpha*( X*(sigmoid(w'*X)-y)'/m + lambda/m*w );
            w(1) = w(1) - lambda/m*tmp;
            w = w - grad;
        end
    end
end
