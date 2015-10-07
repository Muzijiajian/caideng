function p = posterior(x)
%POSTERIOR Two Class Posterior Using Bayes Formula
%
%   INPUT:  x, features of different class, C-By-N vector
%           C is the number of classes, N is the number of different feature
%
%   OUTPUT: p,  posterior of each class given by each feature, C-By-N matrix
%

[C, N] = size(x);
l = likelihood(x);
total = sum(sum(x));
%TODO
% posterior = likehood*prior / evidence
% prior = (each feature) / total
% evidence = sigma[ (probality of each feature)*(number of each feature) ]
    prior = sum(x,2) ./ total;
    big_prior = [];
    for i=1:N
        big_prior = [big_prior,prior];
    end
    evidence = sum(l .* big_prior,1);
    big_evidence = [];
    for i=1:C
        big_evidence = [big_evidence;evidence];
    end
    p = l .* big_prior ./ big_evidence;
end
