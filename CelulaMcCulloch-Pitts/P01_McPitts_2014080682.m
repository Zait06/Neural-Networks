clear
clc
disp('Practica 1: McCulloch-Pitts')
fprintf('Ingrese que compuerta desea que aprenda \n1. NOT\n2. AND\n3. OR\n')
% Selección de la opción
op=input('Ingrese la opcion a elegir: ');
fit=0;

while(op>0)
    clc
    switch(op)
        case 1
        % Inicio de la compuerta NOT
            disp('Compuerta NOT')
            w=input('Valor de w: ');
            theta=input('Valor del umbral: ');
            and=[1 0;0 1];  % Genera la tabla de verdad de la compuerta
            ene=and(1,:)*w; % Multiplicación de p*w
            t=(and(:,end))';    % Copia de los valores de salida de la compueta
            a=[0,0];    % Creación del arreglo
            elems=numel(t); % Numero de elementos de la salida
            for i=1:elems   % Comporbación de los elementos, para valores de a
                if ene(i)>theta
                    a(i)=1; 
                else
                    a(1:i)=0;
                end
            end
    
            target=[0,0];        % Creación de un arreglo t
            for i=1:elems
                if a(i)==t(i)   % Comparación del arreglo a y t para saber
                    target(i)=1;     % si es correcto el aprendizaje
                else
                    target(i)=0;
                    break
                end
            end
    
            if target(i)==1
                disp('La celula aprendio correctamente. Para continuar, presione Enter');
                pause
                op=-1;
            else
                fprintf('Error, quiere ingresar otros valores?\n1.Si 2.No\n')
                qui=input('Respuesta: ');
                if qui==1
                   op=1;
                else
                    op=-1;
                end
            end
        % Fin de la compuerta NOT    
        case 2
        % Inicio de la compuerta AND
            disp('Compuerta AND')
            if fit==0
                entra=input('Numero de entradas que desea ingresar a la compuerta: ');
            end
            w=(1:entra);    %Genera un arreglo con valores de 1 a n, que representan las compuertas
            salida=zeros(1,(2^entra)); % Genera la salida de la tabla de verdad
            salida(end)=1; % Completa la salida de la tabla de verdad de and
            cand=Yolo(entra); % Genera tabla de verdad en Yolo(n)
            
            for i=1:entra
                fprintf('Ingrese el valor w_%d',i);
                w(i)=input(': ');
            end
            theta=input('Ingrese el valor del umbral: ');
            
            ene=w.*cand;  % Hace la operación entre matriz y vector
            n=sumatoria(ene,entra); % Hace las sumatorias de n
            a=paraA(n,entra,theta); % Saca el valor de a>theta
            t=aprende(a,entra,salida);  % Optiene el ultimo valor de la comparación entre a y la salida
                                        % de la tabla de verdad.
            
            if t==1
                disp('La celula aprendio correctamente. Para continuar, presione Enter');
                pause
                op=-1;
            else
                fprintf('Error, quiere ingresar otros valores?\n1.Si 2.No\n')
                qui=input('Respuesta: ');
                if qui==1
                   op=2;
                   fit=1;
                else
                    op=-1;
                end
            end
        % Fin de la compuerta AND
        case 3
        % Inicio de la compuerta OR
            disp('Compuerta OR')
            if fit==0
                entra=input('Numero de entradas que desea ingresar a la compuerta: ');
            end
            w=(1:entra);    %Genera un arreglo con valores de 1 a n, que representan las compuertas
            salida=ones(1,(2^entra)); % Genera la salida de la tabla de verdad
            salida(1)=0; % Completa la salida de la tabla de verdad de and
            cor=Yolo(entra); % Genera tabla de verdad Yolo(n)
            
            for i=1:entra
                fprintf('Ingrese el valor w_%d',i);
                w(i)=input(': ');
            end
            theta=input('Ingrese el valor del umbral: ');
            
            ene=w.*cor;  % Hace la operación entre matriz y vector
            n=sumatoria(ene,entra); % Hace las sumatorias de n
            a=paraA(n,entra,theta); % Saca el valor de a>theta
            t=aprende(a,entra,salida);  % Optiene el ultimo valor de la comparación entre a y la salida
                                        % de la tabla de verdad.
            
            if t==1
                disp('La celula aprendio correctamente. Para continuar, presione Enter');
                pause
                op=-1;
            else
                fprintf('Error, quiere ingresar otros valores?\n1.Si 2.No\n')
                qui=input('Respuesta: ');
                if qui==1
                   op=3;
                   fit=1;
                else
                    op=-1;
                end
            end
        % Fin de la compuerta OR
    end
end

clc
disp('Valor de los pesos sinapticos: ')
disp(w)
disp('Valor del umbral: ')
disp(theta)

guardar(w,theta);

disp('Programa terminado')