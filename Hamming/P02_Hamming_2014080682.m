clear
clc
disp('Practica 2: Red Hamming')
txt=input('Ingrese el nombre del documento donde se encuentran los pesos sinapticos: ','s');
w=load(txt);
txt=input('Ingrese el nombre del documento donde se encuentre el vector prototipo: ','s');
p=load(txt);
[s,r]=size(w);      % Obtención de los valores de r y s
b=(ones(s,1))*r;    % Calculo de bias
a1=(w*(p'))+b;      % Calculo del vector a1
epsilon=0+((1/(s-1))-0).*rand;  % Genera epsilon

a1=poslin(a1);
vaux=(a1');           
guardar(vaux);  % Crea el documento w2.txt y guarda la salida de la
                % capa freeforward
matep=ones(s)*(-epsilon);   % Crea la matriz con epsilons negativos
for i=1:s
    for j=1:s
        if i==j
            matep(i,j)=1;
        end
    end
end

itc=100+(300-100).*rand;            % Numero de iteraciones     
capaRecurrente(matep,a1,itc);       % Hace la tarea de la capa recurrente
w2=load('w2.txt');
graficar(w2);
disp('Programa terminado')