function [  ] = interpolator( a, b, F, n )
%INTERPOLATOR Generates 4 plots of F using polynomial interpolation at 
%               Equidistant and Chebychev points and Spline Interpolation
%   yellow asterisks - original function
%   red triangles - polynomial interpolant at equidistant points
%   blue hexagons - polynomial interpolant at Chebychev points
%   green squares - cubic spline interpolant at equidistant points
%   @param a: the leftmost point on the interval
%   @param b: the rightmost point on the interval
%   @param F: the function to interpolate
%   @param n: the number of interpolation points
hold off;

%Polynomial interpolant i)
X=linspace(a,b,n); %Equidistant x values of the interpolation points
Y=F(X); %Y values of the interpolation points
coeffs(1)=Y(1); %The first coefficient is trivial, is more efficient to set
%directly
coeffs(2:n)=recDDMaker(X,Y,n-1,1,[],[]); %Create the divided differences 
%table to get the coefficients
%Note: Will only get the first output of the function, as we don't need
%newY
meshX=linspace(a,b); %A mesh to graph on
meshY=NewtonPoly(meshX,0,X,coeffs); %Compute the Y values using coeffs
pl=plot(meshX,meshY,'-r'); %Plot the equidistant Newton Polynomial
set(pl,'LineWidth', 1); %Set properties of this line
hold on;
pl1=plot(meshX,F(meshX),'-y'); %Plot the original function
set(pl1,'LineWidth', 1); %Set properties of this line
%Chebychev interpolant ii)
j=0:n-1;
Cheby=(a+b)/2+(b-a)/2.*cos(j*(pi/(n-1))); %Get Chebychev x values
ChY=F(Cheby); %Compute Y values at these points
coeffs(1)=ChY(1);
coeffs(2:n)=recDDMaker(Cheby,ChY,n-1,1,[],[]); %Create a table to get the
%coefficients for the Newton Polynomials at these values
meshY=NewtonPoly(meshX,0,Cheby,coeffs); %Compute the Y values using coeffs
pl2=plot(meshX,meshY,'-b'); %Plot the interpolant at Chebychev points
set(pl2,'LineWidth', 1); %Set properties of this line
%Cubic Spline Interpolation iii)
s=spline(X,Y,meshX); %Get the cubic spline at equidistant points
pl3=plot(meshX,s,'-g'); %Plot the cubic spline interpolant
set(pl3,'LineWidth', 1); %Set properties of this line

end

