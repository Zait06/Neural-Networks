% Perceptron multiples neuronas
clc; clear;
doc=input('Ingrese el nombre del archivo donde se encuentra el dataset: ','s');
numite=input('Ingrese el numero de interaciones: ');
dataset=load(doc);
s=round(log2(end:1));
t=dataset(1:end-1,end-s+1,end);
p=dataset(1:end-1,1:end-1);

[pu,r]=size(p); % pu=numero de puntos
wnow=rand(s,r);
bnow=rand(s,1);

guardaPesos(wnow);
guardaBias(bnow');  % Guarda el primer valor del bias

i=1; cont=0;
ite=0;
% Propagación hacia adelante
while i<=pu
    pax=p(i,:)';
    ac=hardlim(wnow,pax,bnow);
    otro=t(i);
    tax=(tar(otro,:)');
    if isequal(ac,tax)
        cont=cont+0;
    else
        wnow=wnow+((tax-ac)*(pax'));
        editaPesos(wnow);   % Agrega los nuevos pesos
        bnow=bnow+(tax-ac);
        editaBias(bnow');   % Agrega el nuevo bias
        cont=cont+1;
    end

    if(i==pu && cont>0)
        i=0; cont=0; ite=ite+1;
    end
    
    if(ite>numite)
        break
    end
    i=i+1;
end

fprintf('\nVector de pesos sinapticos W:\n');
disp(wnow)
disp('Bias:');
disp(bnow')

clf;
figure(1);
graficaPuntos(wnow,bnow,dataset);
grid;