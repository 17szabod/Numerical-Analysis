function x = ssolve(a,b,n)
%Returns the solution to a particular System of Matrices
A = eye(n,n);
A(1,2)=a;
A(end,1:end-1)=b;
B = (1:n)';
B(end-1,1)=0;
x=A\B;
return
end

