function graficar(w)
    [f,c]=size(w);  % Obtiene las dimensiones de la matriz
    ejequis=(0:f-1);    % Eje X para graficar de 0 hasta las filas creadas
    numclas="";
    for i=1:c
        % Grafica las filas de la columna i que representan las clases
        plot(ejequis,w(:,i),'-o')
        numclas(i)=strcat('c_',string(i));
        hold on
    end
    legend(numclas);    % Inserta un menu con los tipos de clases graficados
    title('Red de Hamming')
    xlabel('Iteraciones')
    ylabel('Valor')
end