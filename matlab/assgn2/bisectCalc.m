%Calculates the amount of iterations need to find a root using the
%bisection method
error=.5;
count=0;
while error>10e-13
    count=count+1;
    error=error/2;
end
count
