function [w, num] = svm(X, y)
%SVM Support vector machine.
%
%   INPUT:  X: training sample features, P-by-N matrix.
%           y: training sample labels, 1-by-N row vector.
%
%   OUTPUT: w:    learned perceptron parameters, (P+1)-by-1 column vector.
%           num:  number of support vectors
%

% YOUR CODE HERE
n = length(y);
X = [ones(1,n);X];
H = 1/2*eye(size(X,1));
% 常数项为0
f = zeros(size(H,1),1);
A = ( [y;y;y] .* X )';
b = ones(n,1);
[w,~] = quadprog(H,f,A,b);
dis = (y .* (w'*X) ) / norm(w);
% 从正的和负的里面找到距离相对较大的一个作为支持向量的最低标准
value1=inf;
value2=inf;
for i=1:length(dis)
    if dis(i)>0  
        if dis(i) < value1
            value1 = dis(i);
            continue;
        end
    else
        if (-dis(i)) < value2
            value2 = -dis(i);
            continue;
        end
    end
end
if value1 >= value2
    num = sum( sort(abs(dis)) <=  value1);
else
    num = sum( sort(abs(dis)) <=  value2);
end
end
