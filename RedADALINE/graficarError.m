function graficarError(e)
    % Grafica el error por epoca
    plot(0:numel(e)-1,e,'-o');
    
    title('Evolucion del Error')
    xlabel('Epoca')
    ylabel('Valor')
end