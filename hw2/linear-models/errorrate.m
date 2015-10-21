function e_rate = errorrate(X,w,y)
%ERRORRATE Calculation Function.
%
%   INPUT:  X: training sample features, P-by-N matrix.
%           y: training sample labels, 1-by-N row vector.
%           w: learned perceptron parameters, (P+1)-by-1 column vector.
%   OUTPUT: 
%           e_rate: the error rate of labled values
%
    m = length(y);
    tmp_X = [ones(1,m);X];
    final_y = sign(w'*tmp_X);
    error_num = sum(final_y~=y);
    e_rate = error_num/m;
end