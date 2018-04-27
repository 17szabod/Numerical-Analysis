function [ output_args ] = k( x )
%K k(x)=|x|^(3/2)
output_args=abs(x).^(3/2);
%output_args=sin(1./x);
%output_args=1./(1+x.^2); <- some mean examples I used
return

end

