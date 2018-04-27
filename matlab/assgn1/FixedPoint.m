x=.8;%place x0 here
diff = 1;
steps = 0;
output='using cos(x)+x-x^2'
while abs(diff) >= 10^(-10)
    steps = steps + 1;
    xold = x;
    x= cos(x)+x-x^2;%(g(x)), place equation here
    diff = x-xold;
    if steps > 100000000
        error = strcat('over 100000000 steps, x right now is: ', string(x), ', Last x was:', string(xold))
        break
    end
end
steps
x
%cos(x)+x-x^2 <-- did not converge
%sqrt(cos(x))
%x = x - ((x^2-cos(x))/(2*x-sin(x))) <-- quadratic
%x=(x^3)/cos(x)
%x=acos(x^3)