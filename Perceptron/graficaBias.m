function graficaBias(b)
    [f,c]=size(b);
    x=0:f;
    for i=1:c
        plot(f,b(:,i))
    end
end