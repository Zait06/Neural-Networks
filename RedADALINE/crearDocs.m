function crearDocs()
    vo=fopen('errorEpoca.txt','w'); % Crea documento para guardar los
    fclose(vo);                     % errores por epoca
    
    vo=fopen('bias.txt','w');   % Crea documento para guardar los valores
    fclose(vo);                 % de bias
    
    vo=fopen('pesos.txt','w');  % Crea documento para guardar los valores
    fclose(vo);                 % de los pesos sinapticos
end