function [t]=aprende(arr,n,sal)
    aux=(1:2^n);
    for i=1:2^n
        if arr(i)==sal(i)
            aux(i)=1;
        else
            aux(i)=0;
            break
        end
    end
    t=aux(i);
end