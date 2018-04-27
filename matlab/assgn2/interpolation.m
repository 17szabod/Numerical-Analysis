%Using Vandermonde's method
hold off;
Input = 1:.5:4; %Modify points to input
V = repmat(Input', 1, 7); %Create the base of the Vandermonde matrix
yVals=cos(Input');
powers = 6:-1:0; %The powers to raise V to, 1 dimensional is okay
V=V.^powers;
coeffs=V\yVals; %Calculate the y values
x=linspace(-1,7); %Generate x values to graph on
y=f(coeffs,x); %Use our generated function to create y values at all x
plot(x,y); %Plot our new function (occasionally fancy)
title('Using cos(x) (on interval [1:.5:4])')
hold on;
plot(x, cos(x)); %Plot the original function on the same graph
totErr=f(coeffs,x)-cos(x); 
%Take the error at each of the 100 points in linspace
maximalError=max(abs(totErr)) %Maximum error on the interval
AverageError=mean(totErr) %Average error on the interval