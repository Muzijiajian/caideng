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
    % ���ÿһ��X��sample,�ҵ�����ѵ�����ݼ��������k���㣬������k�����lableֵ����ѡ��
    % ���ִ�������һ����
    [~,m] = size(X);
    y = zeros(1,m);
    % calculate distance matrix for each X sample
    % Ĭ����ÿһ����һ����������pdist2����Ĭ�������н��м��㣬����Ҫת�ã������������д洢
    dis_matrix = pdist2(X',X_train','euclidean');
    % �Ծ���������������ע�Ᵽ��ԭ����ѵ������֮�����Ķ�Ӧֵ
    [~,total_index] = sort(dis_matrix,2);
    % ����Ӧ��������ĵ����������Ӧ���±�ֵ����
    [t_i,t_j] = size(total_index);
    total_index_label = zeros(t_i,t_j);
    for i=1:t_i
        for j=1:t_j
            total_index_label(i,j) = y_train( total_index(i,j) );
        end
    end 
    % ��ȡѵ��label�ķ�Χ
    y_train_range = max(y_train)-min(y_train)+1;
    for i=1:m
        % ��ÿһ������ȡǰk��ֵ����������lableֵ������lableֻ�ܴ��±�1��ʼ
       [label_dis,~] = hist(total_index_label(i,1:K),1:y_train_range);
       % �������Ŀ��label��Ϊ��ǰsample��label
       [~,cur_label] = max(label_dis);
       y(i) = cur_label;
    end
end

