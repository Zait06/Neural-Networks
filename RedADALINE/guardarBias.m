function guardarBias(b)
    % Inserta el nuevo valor del bias
    vo=fopen('bias.txt','a');
    for i=1:numel(b)
        fprintf(vo,'%f ',b(i));
    end
    fprintf(vo,'\n');
    fclose(vo);
end