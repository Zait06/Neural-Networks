function [vec]=poslin(a)
    vaux=(a');
    tam=numel(a');
    for i=1:tam
        % Si el valor del vector es mayor a cero, este conservar� su valor
        % en caso contrario, guardar� un cero.
        if vaux(i)>0
            vaux(i)=vaux(i);
        else
            vaux(i)=0;
        end
    end
    vec=vaux'; % Devuelve el nuevo vector
end