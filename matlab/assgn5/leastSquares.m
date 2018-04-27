function [ PolyE, SplE ] = leastSquares( n, m, a, f )
%LEASTSQUARES approximates the function by least squares with splines and
%polynomials
%   @param n the number of interpolation points
%   @param m the number of data points
%   @param a the scale of the error (white noise)
%   @param f a function to perform the regression on
%   @return the polynomial error vector and the spline error vector
plotIt=0; % a boolean variable for whether to plot the functions
L=-2; % The leftmost bound
R=1; % The rightmost bound
hold off;
x = linspace(L,R,m); % generate m standard x coordinates
trueY = f(x);
noise = (random('norm',0,a,1,m)); % create white noise that grows with a
y = trueY + noise; % generate noisey y values

for i=0:n
    Vt(n-i+1,1:m)=x.^i; % create V^t
end
V=Vt'; % create V
coeffs=(Vt*V)\(Vt*y'); % use the Normal Equation to generate coefficients

splineX=linspace(L,R,n-1); % generate central spline points
SP=spap2(augknt(splineX,4),4,x,y); % generate external and internal knots
% and interpolate the data with splines

meshX=linspace(L,R);
meshExactY=f(meshX);
meshLSPoly=p(meshX,coeffs);
meshLSSP=spval(SP,meshX);
PolyE=meshLSPoly-meshExactY; % find the errors
SplE=meshLSSP-meshExactY;
if (plotIt) %plot the graph if so specified
    hold on;
    plot(x,y,'*');
    plot(meshX,meshExactY, '-r');
    plot(meshX,meshLSPoly, '-x');
    plot(meshX,meshLSSP, '-c');
end
return
end

