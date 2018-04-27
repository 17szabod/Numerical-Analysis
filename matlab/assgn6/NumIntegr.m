disp('For f=x^2-3x+2, using Composite Simpsons with h=1:');
ans = ((1^2-3*1+2)+4*(1.5^2-3*1.5+2)+(2^2-3*2+2))/6 
%I felt it would be faster and more efficient to just compute it directly,
%as it is a small computation
disp('For f=arctan(3x-4), using Composite Simpsons with h=.05:');
simpson(20,@f2)
disp('For f=sin(x/2), using Composite Simpsons with h=1/3:');
simpson(3,@f3)
disp('For f=(2-x)^(5/2), using Composite Midpoint with 396 subintervals:');
t=linspace(1,2,397); %Need points to be spaced as if it were 397
h=1/396;
ans = 0;
for i=1:396 %but only do calculations of first 396  + h/2
    x=(t(i)+h/2);
    ans = ans+f4(x)*h;
end
ans
%f(x)=sqrt(abs(x-1.5))'s derivatives are undefined at 1.5, so the error
%formulas are useless and this integral must be done manually

%Some private functions to represent the different functions
function [out] = f2(x)
out=atan(3*x-4);
return
end
function [out] = f3(x)
out=sin(x/2);
return
end
function [out] = f4(x)
out=(2-x)^(5/2);
return
end