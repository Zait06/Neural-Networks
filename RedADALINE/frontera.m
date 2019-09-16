function frontera(b,p1,p2,max)
    % Grafica la frontera de decición
    yd=-b/p1;
    m=(-p2)/(-p1);
    m=-1/m;
    xa=max+1;
    xb=-max-1;
    ya=(m*xa)+yd;
    yb=(m*xb)+yd;
    x=[xa xb];
    y=[ya yb];
    
    line(x,y,'Color','r')
end