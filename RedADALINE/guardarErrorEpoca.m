function guardarErrorEpoca(e)
    % Guarda el valor del error de una epoca
    vo=fopen('errorEpoca.txt','a');
    fprintf(vo,'%f\n',e);
    fclose(vo);
end