function g = sigmod(z)
%SIGMOD Compute sigmod functoon
%J = SIGMOD(z) computes the sigmod of z.
    g = zeros(size(z));
    g = 1 ./ (1 + ( 1./exp(z) ));
end