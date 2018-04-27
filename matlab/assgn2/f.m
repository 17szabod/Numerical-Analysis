function [out] = f(coeffs, x)
%F Applies the coefficients to all elements of x
%   computes f(x)=a(n)+a(n-1)x(2)+...+a(1)x(n) where a(j) are elements of
%   coeffs, and does so for all x
out = zeros(size(x));
for i=1:length(x)
    f=0; %Wasn't necessary to make a new variable here, but it felt cleaner
    for n=1:7
       f=f+coeffs(end-n+1)*x(i)^(n-1);
    end
    out(i) = f;
end
return
end

