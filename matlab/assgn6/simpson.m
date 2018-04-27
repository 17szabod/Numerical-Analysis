function [ output_args ] = simpson(n, f)
%SIMPSON a function that computes the Composite Simpson approximation for f
%       on the interval [1,2]
%   @param n The number of subintervals, ie n st 1/n=h
%   @param f The function to approximate
h=1/n;
t=linspace(1,2,2*n+1); %where the [1,2] is defined, could easily be abstracted
%Use a matrix S to store all the values to sum up
S(1)=f(1)*h/6;
for i=2:2*n
    S(i)=f(t(i))*(mod(i+1,2)+1)*h/3; %chooses 1 or 2 * h/3
end
S(end+1)=f(2)*h/6;
output_args=sum(S);
return
end

