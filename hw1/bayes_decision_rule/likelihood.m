function l = likelihood(x)
%LIKELIHOOD Different Class Feature Liklihood 
%
%   INPUT:  x, features of different class, C-By-N vector
%           C is the number of classes, N is the number of different feature
%
%   OUTPUT: l,  likelihood of each feature(from smallest feature to biggest feature) given by 
%               each class, C-By-N matrix
%

[C, N] = size(x);
l = zeros(C, N);
%TODO
% l = x ./ repmat(sum(x, 2), [1, size(x,2)]);
%算的是对每一个feature而言(如颜色)，每一个class所占的比例(如RGB)
total = sum(x,2);
for i=1:C
    total_i = total(i);
    %下面的算式有优化的空间，直接用矩阵的一行除以整行的总和
    for j=1:N
        l(i,j) = x(i,j) / total_i;
    end
end

end
