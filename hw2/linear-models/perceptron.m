function [w, iter] = perceptron(X, y)
%PERCEPTRON Perceptron Learning Algorithm.
%
%   INPUT:  X: training sample features, P-by-N matrix.
%           y: training sample labels, 1-by-N row vector.
%
%   OUTPUT: w:    learned perceptron parameters, (P+1)-by-1 column vector.
%           iter: number of iterations
%

% YOUR CODE HERE
% ��ʼ��Ȩֵw������ƫ��ֵb,�Լ�ѧϰ����rate=1
w = zeros(size(X,1),1);
b = 0.0;
rate = 0.5;
iter = 0;
% ����ѭ������ֱ��all samples are well classified 
num_sample = size(X,2);
cur_point_value = 0;
num_error = 0;
while 1
    iter = iter+1;
    for j=1:num_sample
        cur_point_value = w'*X(:,j)*y(j);
        if  cur_point_value <= 0
            num_error = num_error + 1;
            w = w + y(j)*rate*X(:,j);
            b = b + y(j)*rate;
            break;
        end
    end
    % ������ֹ��������ʼ����w��b��ȫ�������������е㶼�����º��w��b��ȷ����
    if all(w'*X.*y) || num_error==0
        w = [w;ones(1,1)];
        break;
    end
end
% show the test error
%test_w = w(1:end-1,1);
%final_y = sign(test_w'*X);
%error_num = num_sample - sum(final_y==y);
%error_rate = error_num/num_sample;
%fprintf('The test error of %d samples are: %.2d\n',num_sample,error_rate);
end
