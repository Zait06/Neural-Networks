function [tabla]=asignar(entrada)
    yok=(dec2bin((0:(2^entrada)-1)));
    vava=zeros((2^entrada)-1,entrada);
    for i=1:(2^entrada)
        for j=1:entrada
            vava(i,j)=str2num(yok(i,j));
        end
    end
    tabla=vava;
end