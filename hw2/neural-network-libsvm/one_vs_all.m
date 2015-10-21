function w = one_vs_all(X,y)
    range = max(y)-min(y)+1;
    w = zeros(range,size(X,1));
    X_sparse = sparse(X)';
    for i=min(y):max(y)
        X_label = double(y==i)';
        idx=find(X_label==0);       % find all 0
        X_label(idx)=-1;            % set -1 to these indexes
        model = train(X_label,X_sparse,'-c 1');
        w(i,:) = w(i,:) + model.w;
    end
end