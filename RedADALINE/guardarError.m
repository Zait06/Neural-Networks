function guardarError(e,h)
    % Crea e inserta los valores de los errores de una epoca
    vo=fopen('error.txt',h);
    fprintf(vo,'%f\n',e);
    fclose(vo);
end