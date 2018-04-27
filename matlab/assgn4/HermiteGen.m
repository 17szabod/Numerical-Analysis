function [ s ] = HermiteGen( n, A )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
X=A(1,1:n);
Y=A(2,1:n);
dY=A(3,1:n);
for i=1:n-1
    %Could do this using the recursive code frome the last submission, but
    %that would be inefficient as we are defined to have 4 points
    p(4)=Y(i);
    p(3)=dY(i);
    val=((Y(i)-Y(i+1))/(X(i)-X(i+1)));
    p(2)=(p(3)-val)/(X(i)-X(i+1));
    p(1)=(p(2)-((val-dY(i+1))/(X(i)-X(i+1))))/(X(i)-X(i+1));
    p(2)=p(2)-p(1)*(X(i+1)-X(i)); %Adjustment for proper matlab form
    C(i,1:4)=p;
end
s=mkpp(X, C);
return;
end

