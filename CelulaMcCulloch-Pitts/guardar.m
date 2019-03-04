function guardar(w,theta)
    vo=fopen('pesos_y_umbral_finales.txt','w');
    fprintf(vo,'Pesos sinampticos:\n');
    for i=1:numel(w)
        fprintf(vo,'%d ',w(i));
    end
    fprintf(vo,'\n\nUmbral:\n%d\n',theta);
    fclose(vo);
end