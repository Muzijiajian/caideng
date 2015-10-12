function e_rate = errorrate(X,w,y)
%ERRORRATE Calculation Function.
%
%   INPUT:  X: training sample features, P-by-N matrix.
%           y: training sample labels, 1-by-N row vector.
%           w: learned perceptron parameters, (P+1)-by-1 column vector.
%   OUTPUT: 
%           e_rate: the error rate of labled values
%
    num_sample = size(X,2);
    test_w = w(1:end-1,1);
    final_y = sign(test_w'*X);
    error_num = num_sample - sum(final_y==y);
    e_rate = error_num/num_sample;
end