function V=FVdiscreta2(Respuesta,Valores)

% Como FVdiscreta, pero para cualquier número de respuestas.
% Respuesta es una variable discreta entera que comienza en 1. Puede
% adoptar los valores 1, 2, 3, ..., estando cada uno de esos valores
% asociados a una respuesta (de forma ordenada) y, por tanto, a un nivel de
% satisfacción en "Valores".
% Valores es un vector que incluye los niveles de satisfacción de cada una
% de las respuestas de forma ordenada.

% Habría que mejorarla de forma que si el valor de respuesta no es adecuado
% (por ejemplo, por encima del tamaño del vector, o no es entero o lo que
% sea) que de mensaje de error y explicación. Por ahora, queda así.

A=max(size(Valores));

for i=1:A
    if Respuesta==i
        V=Valores(i);
    end
end