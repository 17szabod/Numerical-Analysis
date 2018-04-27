hold off;
min = 0;
max = 10;
for a=min:.125:max
    % I evaluate 3 different outputs and take the average in an effort to
    % decrease randomness
   [tmpPoly1,tmpSpl1]=leastSquares(5,50,a,@h);
   [tmpPoly2,tmpSpl2]=leastSquares(5,50,a,@h);
   [tmpPoly3,tmpSpl3]=leastSquares(5,50,a,@h);
   poly((a*8)+1)=(var(tmpPoly1)+ var(tmpPoly2) + var(tmpPoly3))/(3);%*sqrt(m));
   spl((a*8)+1)=(var(tmpSpl1) + var(tmpSpl2) + var(tmpSpl3))/(3);%*sqrt(m));
end
x=1:(max-min)*8+1;
hold on
plot(poly, 'xb');
plot(spl, '*r');
polyFit=polyfit(x,poly, 2); % Somewhat ironic
splFit=polyfit(x,spl, 2);
plot(polyval(polyFit,x), '-b');
plot(polyval(splFit,x), '-r');
legend('Polynomial', 'Spline')
clear poly, clear spl;