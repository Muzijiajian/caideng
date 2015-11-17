function new_data = feature_preprocess(data)
    %...
    [m,n] = size(data);
    new_data = zeros(m,n);
    mu = mean(data,1);
    % 方差是一个标量，只能对某一个feature进行求解
    variance = sqrt(var(data));
    for i=1:m
        new_data(i,:) = ( data(i,:)-mu(i) ) ./ variance(i);
    end
end