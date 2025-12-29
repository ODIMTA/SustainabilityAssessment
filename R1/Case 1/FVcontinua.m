function V=FVcontinua(Px,Pmin,Pmax,n,m,A,c)

% Px es el valor de entrada a la FV
% Pmin es el valor que devuelve un 0
% Pmax es el valor que devuelve un 1
% n,m y A son los parámetros que condicionan la geometría de la FV
% c para especificar si es creciente ('creciente') o decreciente 
% 'decreciente'
% No se han establecido límites de entrada a la FV. De forma que, si la FV
% es creciente y Px es menor que Pmin, V=0 (si Px es mayor que Pmax, V=1).
% Analogamente si FV es decreciente y Px es menor que Pmax, V=1 (si Px es
% mayor que Pmin, V=0).

T=strcmp(c, 'creciente');

if (T==1 && Px<Pmin) || (T==1 && Px>Pmax) || (T~=1 && Px<Pmax) || (T~=1 && Px>Pmin)
    if (T==1 && Px<Pmin)
        V=0;
    end
    if (T==1 && Px>Pmax)
        V=1;
    end
    if (T~=1 && Px<Pmax)
        V=1;
    end
    if (T~=1 && Px>Pmin)
        V=0;
    end
else
    k=1/(1-exp(-m*(abs(Pmax-Pmin)/n)^A));
    V=k*(1-exp(-m*(abs(Px-Pmin)/n)^A));
end

% Si queremos pintar la FV:
%if T==1
%    axis([Pmin Pmax 0 1])
%    P=Pmin:0.001:Pmax;
%    kcurva=1/(1-exp(-m*(abs(Pmax-Pmin)/n)^A));
%    curva=kcurva*(1-exp(-m*(abs(P-Pmin)/n).^A));
%else
%    axis([Pmax Pmin 0 1])
%    P=Pmax:0.001:Pmin;
%   kcurva=1/(1-exp(-m*(abs(Pmax-Pmin)/n)^A));
%    curva=kcurva*(1-exp(-m*(abs(P-Pmin)/n).^A));
%end

%plot (P,curva,'b')
%axis auto
%grid