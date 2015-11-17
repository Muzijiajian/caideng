function new_data = feature_preprocess(data)
    %...
    [m,n] = size(data);
    new_data = zeros(m,n);
    mu = mean(data,1);
    % ������һ��������ֻ�ܶ�ĳһ��feature�������
    variance = sqrt(var(data));
    for i=1:m
        new_data(i,:) = ( data(i,:)-mu(i) ) ./ variance(i);
    end
end