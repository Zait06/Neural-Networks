function graficaPuntos(w,b,dataset)
    t=dataset(:,3:end);
    p=dataset(:,1:2);
    [f,c]=size(p);
    [f1,c1]=size(w);
    colores=['k','b','g','r','c','m','y'];
    ese=1;
    
    m1=max(w);
    m2=max(p);
    maxi=max(m1,m2);
    maxi=max(maxi);
    texto=""; n=1;
    
    for i=1:f1
        frontera(b(i),w(i,1),w(i,end),maxi);    % Grafica la frontera
        texto(n)=strcat('F_',string(i));
        n=n+1;
        hold on
        quiver(0,0,w(i,1),w(i,end),0,'filled')
        texto(n)=strcat('W_',string(i));
        n=n+1;
        hold on
    end
    
    for i=1:f
        if ese~=t(i,end)
            ese=ese+1;
        end
        scatter(p(i,1),p(i,end),25,colores(ese),'filled')
        texto(n)=strcat('p_',string(i));
        n=n+1;
        hold on
    end
    
    axis([-maxi-2 maxi+2 -maxi-2 maxi+2])
    title('Perceptron multiples entradas')
    legend(texto)
end