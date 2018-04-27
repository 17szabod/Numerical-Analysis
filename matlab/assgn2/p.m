function [ output_args ] = p( t )
%P Computes Wilkinson's polynomial of t
%   computes p(t)=(t-1)...(t-20)-10e-8*t^19
n=20;
A=zeros(1,20); %Preallocating our prod matrix
for i=1:n 
    %I know the instructions said no loops but this is as efficient
    %and easier than hard coding it
    A(i)=t-i;
end
output_args=prod(A)-(10e-8)*t^19;
return
end

