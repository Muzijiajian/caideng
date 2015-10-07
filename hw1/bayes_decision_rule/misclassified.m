function wrong_num = misclassified(X,l)
% MISCLASSIFIED function tells the total wrong predition numbers based on
% MLD rule
%
%   INPUT:  X, features of different class, C-By-N vector
%           l, likelihood of each feature(from smallest feature to biggest feature) given by 
%               each class, C-By-N matrix
%   OUTPUT: wrong_num, sum of wrong predition numbers based on maximum likehood
%   decision rule

[M,N] = size(X);    
sum_x = sum(X,1);
% for all classes
wrong_num = 0;
for i = 1:N
    %find the most important feature(row in matrix) in each class(column in matrix)
    [M,big] = max(l(:,i)); 
    wrong_num = wrong_num + (sum_x(1,i) - X(big,i));
end
end