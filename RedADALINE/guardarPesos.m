function guardarPesos(w)
    % Guarda el valor de los pesos 
    vo=fopen('pesos.txt','a');
    for i=1:numel(w)
        fprintf(vo,'%f ',w(i));
    end
    fprintf(vo,'\n');
    fclose(vo);
end