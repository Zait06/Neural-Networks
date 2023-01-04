function capaRecurrente(mat,a2,ite)
    vaux=a2'; cnt=0;
    tipclas=0;
    tam=numel(a2');
    for i=1:tam
        if vaux(i)==0
            cnt=cnt+1;  % Cuenta el numero de ceros
        else
            tipclas=i;  % Guarda la posible clase que converje
        end
    end
    
    if ite==0   % Si sobrepasa el valor de iteraciones, sale de la función
        disp('Iteraciones terminadas')
    elseif cnt<tam-1        % Si sigue habiendo ceros, continua con la función
        aux=poslin(mat*a2); % Llama a la función poslin
        editar(aux');       % Guarda los nuevos valores de w2
        capaRecurrente(mat,aux,ite-1);  % Llama de nuevo a la función
    else
        fprintf('\n')
        disp('Convergencia encontrada')
        fprintf('Vector de entrada de clase %d\n',tipclas)
        % Termina con la función y sale para poder graficar
    end
end