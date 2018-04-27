function [ y ] = p( t,coeffs )
%P Evaluates coefficients for t monomials
%   Recursively goes through each element in coeffs and multiplies it by
%   correct power of t, or x
if(isempty(coeffs))
    y=0; % base case
    return
end
thisVal=coeffs(1,1)*t.^(length(coeffs)-1);
coeffs=coeffs(2:end,1); % the ,1s here are unnecessary but safer
y=thisVal+p(t,coeffs); % recurse with the modified coeffs vector
return

end

