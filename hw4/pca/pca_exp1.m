load('ORL_data', 'fea_Train', 'gnd_Train', 'fea_Test', 'gnd_Test');

% YOUR CODE HERE

% 1. Feature preprocessing
fea_Train = feature_preprocess(fea_Train);
fea_Test = feature_preprocess(fea_Test);
% 2. Run PCA
[eigvector, eigvalue] = pca(fea_Train);
% 3. Visualize eigenface
show_face(eigvector');
k = [8,16,32,64,128];
for i=1:length(k)
    % 4. Project data on to low dimensional space
    fea_Test_low = fea_Test*eigvector(:,1:k(i));
    fea_Train_low = fea_Train*eigvector(:,1:k(i));
    % 5. Run KNN in low dimensional space
    label = knn(fea_Test_low',fea_Train_low',gnd_Train',1);
    % calculate and show error rate
    error_rate = length(find( label~=gnd_Test' )) / length(gnd_Test);
    fprintf('PCA when choose K=%d , the test error rate =%f\n', k(i), error_rate); 
    
end
% 6. Recover face images form low dimensional space, visualize them
