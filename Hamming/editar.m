function editar(w)
    vo=fopen('w2.txt','a');     % Abre el documento w2.txt para editarlo
    for i=1:numel(w)
        fprintf(vo,'%d ',w(i)); % Gaurda los nuevos valores
    end
    fprintf(vo,'\n');
    fclose(vo);                 % Cierra el documento
end