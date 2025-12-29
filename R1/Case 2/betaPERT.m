function [a,b]=betaPERT(min,mode,max)


%(2*(max+4*mode-5*min)/(3*(max-min)))
%(1+4*((mode-min)*(max-mode)/((max-min)^2)))

a=(2*(max+4*mode-5*min)/(3*(max-min)))*(1+4*((mode-min)*(max-mode)/((max-min)^2)));
b=(2*(5*max-4*mode-min)/(3*(max-min)))*(1+4*((mode-min)*(max-mode)/((max-min)^2)));

%lambda=4;

%mu=(min+lambda*mode+max)/(lambda+2);
%a=((mu-min)*(2*mode-min-max))/((mode-mu)*(max-min));
%b=a*(max-mu)/(mu-min);

% multiplicar los datos de la beta con a y b por (max-min) y sumar el min
% para que haya correspondencia con la beta PERT.