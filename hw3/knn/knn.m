function y = knn(X, X_train, y_train, K)
%KNN k-Nearest Neighbors Algorithm.
%
%   INPUT:  X:         testing sample features, P-by-N_test matrix.
%           X_train:   training sample features, P-by-N matrix.
%           y_train:   training sample labels, 1-by-N row vector.
%           K:         the k in k-Nearest Neighbors
%
%   OUTPUT: y    : predicted labels, 1-by-N_test row vector.
%

% YOUR CODE HERE
    % 针对每一个X的sample,找到其在训练数据集中最近的k个点，根据这k个点的lable值进行选择
    % 出现次数最多的一个类
    [~,m] = size(X);
    y = zeros(1,m);
    % calculate distance matrix for each X sample
    % 默认是每一列是一个样本，而pdist2函数默认是以行进行计算，故需要转置，计算结果是以行存储
    dis_matrix = pdist2(X',X_train','euclidean');
    % 对距离样本进行排序，注意保留原先与训练样本之间距离的对应值
    [~,total_index] = sort(dis_matrix,2);
    % 将对应距离最近的点的样本所对应的下标值存入
    [t_i,t_j] = size(total_index);
    total_index_label = zeros(t_i,t_j);
    for i=1:t_i
        for j=1:t_j
            total_index_label(i,j) = y_train( total_index(i,j) );
        end
    end 
    % 获取训练label的范围
    y_train_range = max(y_train)-min(y_train)+1;
    for i=1:m
        % 对每一个样本取前k个值里所包含的lable值，这里lable只能从下标1开始
       [label_dis,~] = hist(total_index_label(i,1:K),1:y_train_range);
       % 将最多数目的label作为当前sample的label
       [~,cur_label] = max(label_dis);
       y(i) = cur_label;
    end
end

