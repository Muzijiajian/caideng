load('TDT2_data', 'fea', 'gnd');
% YOUR CODE HERE
options = [];
options.NeighborMode = 'KNN';
option.k = 6;
options.WeightMode = 'HeatKernel';
option.t = 1;
W = constructW(fea,options);
s_idx = spectral(W, 6);
fea_full = full(fea);
% cluster_plot(fea_full, idx);
[k_idx, ctrs, iter_ctrs] = kmeans(fea_full, 6);