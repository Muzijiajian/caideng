% mu: 2x1 matrix
% Sigma: 2x2 matrix
% phi: a number

% 线性划分
mu0 = [0,0]';
Sigma0 = [1 0;0 1];
mu1 = [1,1]';
Sigma1 = [1 0;0 1];
phi = 0.5;
plot_ex1(mu0, Sigma0, mu1, Sigma1, phi, 'Line', 1);
% 线性单边划分
mu0 = [0,0]';
Sigma0 = [1 0;0 1];
mu1 = [1,1]';
Sigma1 = [1 0;0 1];
phi = 0.001;
plot_ex1(mu0, Sigma0, mu1, Sigma1, phi, 'Line (one side)', 2);
% 抛物线划分
mu0 = [3 6]';
Sigma0 = [1/2 0;0 2];
mu1 = [3 -2]';
Sigma1 = [2 0;0 2];
phi = 0.5;
plot_ex1(mu0, Sigma0, mu1, Sigma1, phi, 'Parabalic', 3);
%
