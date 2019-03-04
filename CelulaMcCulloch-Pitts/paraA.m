function [otr]=paraA(arr,n,t)
    aux=zeros(1,2^n);
    for i=1:2^n
        if arr(i)>t
            aux(i)=1;
        else
            aux(i)=0;
        end
    end
    otr=aux;
end