function [ hermE, cubE ] = SplinePlotter( a, b, F, dF, n )
%SPLINEPLOTTER Summary of this function goes here
%   Detailed explanation goes here
hold off;

X=linspace(a,b,n); %Equidistant x values of the interpolation points
Y=F(X); %Y values of the interpolation points
dY=dF(X);
A(1,1:n)=X;
A(2,1:n)=Y;
A(3,1:n)=dY;
s=HermiteGen(n,A);
meshX=linspace(a,b); %A mesh to graph on
meshY=ppval(s,linspace(a,b)); %Compute the Y values using coeffs
plot(meshX,meshY,'-r'); %Plot the Hermite Polynomial
hold on;
Cs=spline(X,Y);
CmeshY=ppval(Cs,linspace(a,b));
plot(meshX,CmeshY,'-g'); 
title(['Using ' func2str(F) ' between ' num2str(a) ', ' num2str(b) ' with n=' num2str(n)]);
plot(meshX,F(meshX),'-c'); %Plot the original function
hermE=max(abs(F(meshX)-meshY));
cubE=max(abs(F(meshX)-CmeshY));
legend('Hermite','Cubic Spline','Original');
return

end

