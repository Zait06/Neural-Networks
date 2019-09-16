function guardaPesos(w)
    vo=fopen('pesos.txt','w');
    [f,c]=size(w);
    for i=1:f
        for j=1:c
            fprintf(vo,'%f ',w(i,j));
        end
        fprintf(vo,'\n');
    end
    fclose(vo);
end