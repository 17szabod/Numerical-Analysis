a=20.5;
b=21;   
%These had to be more precise than 20 and 22 to get convergence to the
%correct root (although 20.5 and 22 would've worked), I determined these
%values through two runs of the bisection algorithm
count=0;
error=b-a;
while (abs(error)>10e-13)
    b=a-(p(a)*(a-b))/(p(a)-p(b));
    temp=a;
    a=b;
    b=temp;
    error=b-a;
    count=count+1;
end
count
b