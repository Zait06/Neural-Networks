% Red ADALINE
% Hernández López Ángel Zait
clc; clear;

dtst=input('Nombre del archivo donde se encuentra el dataset: ','s');
dataset=load(dtst);
epochmax=input('Numero de epocas máxima: ');
eepoch=input('Valor del error minimo que tienda a cero: ');
alfa=input('Factor de aprendizaje alpha: ');
fprintf('Elija un modo para ADALINE:\n\t1. Clasificador\n\t2. Regresor\n');
opc=input('Tipo: ');

% Calculo de s y obtención de t y p
if opc==1
    numClas=dataset(end,1);
    s=round(log2(numClas));
    p=dataset(1:end-1,1:end-s);
    t=dataset(1:end-1,end-s+1:end);
elseif opc==2
    p=dataset(:,1:end-1);
    t=dataset(:,end);
    s=1;
end

% Creación de los pesos y el bias
[pu,r]=size(p);
w=rand(s,r);
b=rand(s,1);

% Creación de documentos
crearDocs()
guardarPesos(w)
guardarBias(b)

% Inicio de las epocas
i=1;
epocas=0;
flag=false;
while i<=pu
    % Identificar si sobreescribira o creará un nuevo documento
    if i==1
        hago='w';
    else
        hago='a';
    end
    
    pax=p(i,:)';
    
    a=purelin(w,pax,b);    % Función purelin
    
    % Obtención del error
    e=t(i,:)'-a;
    guardarError(abs(e),hago)
    
    % Regla de aprendizaje
    w=w+((2.*alfa.*e).*pax');
    b=b+(2.*alfa.*e);
    
    % Guardado de los pesos y bias
    guardarPesos(w)
    guardarBias(b)
    
    if i==pu
        Eepoch=ErrorEpoca(load('error.txt'));   % Calculo de Eepoch
        guardarErrorEpoca(Eepoch)   % Guardado de Eepoch por epoca
        epocas=epocas+1;
        if (Eepoch==0 || epochmax<epocas || flag)   % Criterios de finalización
            break
        elseif Eepoch<eepoch
            i=0; flag=true;
        else
            i=0;
        end
    end

    i=i+1;
end

disp('Valores de los pesos sinapticos:')
disp(w)

disp('Valor del bias:')
disp(b)

clf;
figure(1)
graficar(load('pesos.txt'),load('bias.txt'))    % Grafica de pesos y bias

figure(2)
graficarError(load('errorEpoca.txt'))   % Grafica de error por epoca

if opc==1
    figure(3)
    graficarPuntos(w,b,p,t);    % Grafica para los puntos
end

disp('Programa terminado')