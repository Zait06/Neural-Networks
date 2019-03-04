function [ll]=sumatoria(mat,can)
    je=zeros(1,2^can);
    for i=1:2^can
        suma=0;
        for j=1:can
            suma=suma+mat(i,j);
        end
        je(i)=suma;
    end
    ll=je;    
end