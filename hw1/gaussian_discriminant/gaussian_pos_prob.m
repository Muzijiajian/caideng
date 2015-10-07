function p = gaussian_pos_prob(X, Mu, Sigma, Phi)
%GAUSSIAN_POS_PROB Posterior probability of GDA.
%   p = GAUSSIAN_POS_PROB(X, Mu, Sigma) compute the posterior probability
%   of given N data points X using Gaussian Discriminant Analysis where the
%   K gaussian distributions are specified by Mu, Sigma and Phi.
%
%   Inputs:
%       'X'     - M-by-N matrix, N data points of dimension M.
%       'Mu'    - M-by-K matrix, mean of K Gaussian distributions.
%       'Sigma' - M-by-M-by-K matrix (yes, a 3D matrix), variance matrix of
%                   K Gaussian distributions.
%       'Phi'   - 1-by-K matrix, prior of K Gaussian distributions.
%
%   Outputs:
%       'p'     - N-by-K matrix, posterior probability of N data points
%                   with in K Gaussian distributions.

N = size(X, 2);
K = length(Phi);
p = zeros(N, K);
% Your code HERE
sigma_size = size(Sigma);   % 其实可以不用计算，直接拿N过来，因为肯定是方阵
posterior = zeros(1,K);
for i=1:N
    x = X(:,i);
    for j=1:K
        sigma = Sigma(:,:,j);
        mu = Mu(:,j);
        % computer the likehood according to the formula
        likehood = 1.0 / ( (2*pi)^(sigma_size(1)/2) * sqrt(det(sigma)) * exp(-0.5*(x-mu)'*pinv(sigma)*(x-mu)) );
        % calculate each feature's posterior
        posterior(j) = Phi(j) * likehood;
    end
    %compute the data 
    for k = 1:K
        p(i,k) = posterior(k) / sum(posterior);
    end
end

end