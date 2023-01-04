function guardar(w)
    vo=fopen('w2.txt','w');     % Crea o abre el documento w2.txt
    for i=1:numel(w)
        fprintf(vo,'%d ',w(i)); % Guarda el contenido de w
    end
    fprintf(vo,'\n');
    fclose(vo);                 % Cierra el documento.
end