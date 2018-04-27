clear h;
clear error;
h(1)=1E-2;
x=5; % sets the value of x in f(x)=x^2 (default 5)
TRUEV=exp(x^2)*2*x;  % you will need to complete this line (derivative of exp(x^2))
for i=2:15
  h(i)=h(i-1)/4;
  D=(exp((x+h(i))^2)-exp((x-h(i))^2))/(2*h(i));
  error(i)=TRUEV-D;
end   
format long 
% try to remove the long format line to see the difference
% try to organize better the printout, so that the entries of
% h align with the entries of error
h = h';
h(1:end,2) = 0;
error = error';
for i=1:size(error)
    error(i,2)=error(i,1);
    error(i,1)=0;
end
adjustment = 7; % adjustment for h values to help visibility
(10^adjustment*h)+error
%hint: h=(5+h)-5, therefore D computes the slope
%of "something".
%"something" is the equation f(x)=e^(x^2) at 5
