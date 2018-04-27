function [ out ] = NewtonPoly( t, j, X, coeffs )
%NEWTONPOLY Recursively performs nested multiplication
%   @param t: value(s) to evaluate at
%   @param j: recursive index
%   @param X: the original X coordinates (X(end) is not used)
%   @param coeffs: the coefficients derived from a DD table
%   @return out: the value(s) of the nested multiplication
n=length(X); %The number of interpolation points
if (j==n-1) %Base case, if this is the innermost value
    out=coeffs(n);
    return %Start to recurse back
end
out=coeffs(j+1)+(t-X(j+1)).*NewtonPoly(t,j+1,X,coeffs);
%Recurseive step, follows the algorithm
end

