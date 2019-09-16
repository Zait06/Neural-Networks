function [a]=hardlim(w,p,b)
    n=(w*p)+b;
    aux=zeros(numel(n),1);
    for i=1:numel(n)
        if n(i)>=0
            aux(i)=1;
        else
            aux(i)=0;
        end
    end
    a=aux;
end