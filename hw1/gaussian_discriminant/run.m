% mu: 2x1 matrix
% Sigma: 2x2 matrix
% phi: a number

% ���Ի���
mu0 = [0 0]';
Sigma0 = [1 0;0 1];
mu1 = [1 1]';
Sigma1 = [1 0;0 1];
phi = 0.5;
plot_ex1(mu0, Sigma0, mu1, Sigma1, phi, 'Line', 1);
% ���Ե��߻���
mu0 = [0 0]';
Sigma0 = [1 0;0 1];
mu1 = [1 1]';
Sigma1 = [1 0;0 1];
phi = 0.001;
plot_ex1(mu0, Sigma0, mu1, Sigma1, phi, 'Line (one side)', 2);
% �����ߵĻ���
mu0 = [3,6]';
Sigma0 = [0.5 0;0 2];
mu1 = [3 -2]';
Sigma1 = [2 0;0 2];
phi = 0.6;
plot_ex1(mu0, Sigma0, mu1, Sigma1, phi, 'Parabalic', 3);
% ˫���ߵĻ���
mu0 = [0 0]';
Sigma0 = [3 0;0 1];
mu1 = [1 1]';
Sigma1 = [1 0;0 4];
phi = 0.6;
plot_ex1(mu0, Sigma0, mu1, Sigma1, phi, 'Hyperbola', 4);
% ����ƽ���ߵĻ���
%mu0 = _;
%Sigma0 = _;
%mu1 = _;
%Sigma1 = _;
%phi = _;
%plot_ex1(mu0, Sigma0, mu1, Sigma1, phi, 'Two parallel lines.', 5);
% Բ�Ļ���
mu0 = [0 0]';
Sigma0 = [4 0;0 4];
mu1 = [2 2]';
Sigma1 = [1 0;0 1];
phi = 0.6;
plot_ex1(mu0, Sigma0, mu1, Sigma1, phi, 'Circle', 6);
% ��Բ�Ļ���
mu0 = [0 0]';
Sigma0 = [2 0;0 3];
mu1 = [1 1]';
Sigma1 = [1 0;0 2];
phi = 0.3;
plot_ex1(mu0, Sigma0, mu1, Sigma1, phi, 'Ellipsoid', 7);
% û�б߽�Ļ���
mu0 = [0,0]';
Sigma0 = [2 0;0 2];    
mu1 = [1,1]';
Sigma1 = [2 0;0 2];
phi = 0.0;
plot_ex1(mu0, Sigma0, mu1, Sigma1, phi, 'Ellipsoid', 8);


