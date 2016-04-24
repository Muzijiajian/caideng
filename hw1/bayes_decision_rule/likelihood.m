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
%����Ƕ�ÿһ��feature����(����ɫ)��ÿһ��class��ռ�ı���(��RGB)
total = sum(x,2);
for i=1:C
    total_i = total(i);
    %�������ʽ���Ż��Ŀռ䣬ֱ���þ����һ�г������е��ܺ�
    for j=1:N
        l(i,j) = x(i,j) / total_i;
    end
end

end
