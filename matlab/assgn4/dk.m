function [ output_args ] = dk( x )
%K dk(x)=k'(x)=3x/2*sqrt(abs(x))
output_args=(3*x)/(2*sqrt(abs(x)));
return

end

