function graficar(w,b)
    [f,c]=size(w);
    [fa,ca]=size(b);
    objeto="";
    % Grafica los valores de los pesos sinapticos
    for i=1:c
        plot(0:f-1,w(:,i));
        objeto(i)=strcat('w_',string(i));
        hold on
    end
    
    n=c+1;
    % Grafica los valores de bias
    for i=1:ca
        plot(0:fa-1,b(:,i),'--');
        objeto(n)=strcat('b_',string(i));
        n=n+1;
        hold on
    end
    
    % Crea una barra donde dice que color es cada peso sinaptico y bias
    legend(objeto);
    title('Evolucion de pesos y bias')
    xlabel('Aplicacion de regla de aprendizaje')
    ylabel('Valor')
end