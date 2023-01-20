classdef Hamming
  properties
    weights_01 = [];  % weights
    weights_02 = [];
    epsilon = [];
    bias = [];        % bias (S x 1)
    p = [];           % input vector
    R = 0;            % size input vector
    S = 0;            % size bias
  endproperties
  
  methods
    function self = Hamming(weights, vector)
      self.weights_01 = weights;
      self.p = vector;
      [self.S, self.R] = size(weights);               % Get sizes
      self.bias = (ones(self.S, 1)) * self.S;         % Compute bias
      self.epsilon = 0 + ((1 / (s - 1)) - 0) .* rand; % Compute espilon
    endfunction

    function a_1 = first_layer(obj)
      % a = purline(n) = n
      a_1 = (obj.weights_01 * (obj.p')) + obj.bias;  % Compute a_1
    endfunction
    
    function self = second_layer(obj, a_2)
      self.weights_02 = (~eye(obj.S) * (-obj.epsilon)) + eye(obj.S) % Crea la matriz con epsilons negativos
      it = 100 + (300 - 100) .* rand;  % Numero de iteraciones
      vaux = a_2';
      cnt = 0;
      tipclas = 0;
      tam = numel(a_2');
      for i = 1:tam
        if vaux(i) == 0
          cnt = cnt + 1;  % Cuenta el numero de ceros
        else
          tipclas = i;  % Guarda la posible clase que converje
        end
      end
      while (it > 0)
      if cnt<tam-1        % Si sigue habiendo ceros, continua con la funci�n
        aux=poslin(mat*a2); % Llama a la funci�n poslin
        % editar(aux');       % Guarda los nuevos valores de w2
        capaRecurrente(mat,aux,ite-1);  % Llama de nuevo a la funci�n
      else
        fprintf('\n')
        disp('Convergencia encontrada')
        fprintf('Vector de entrada de clase %d\n', tipclas)
        % Termina con la funci�n y sale para poder graficar
      end
        it -= 1
      endwhile
      a_2_t = poslin(); % Transfer function
    endfunction

    function train(obj)
      a_1 = first_layer(obj);
      save("output_feedforward.txt", a_1);
    endfunction

    function save(name, data)
      vo = fopen(name, 'w');          % Create/open a document with the name
      for i = 1:numel(data)
        fprintf(vo, '%d ', data(i));  % Save data
      end
      fprintf(vo, '\n');
      fclose(vo);                     % Close document
    endfunction
  endmethods
endclassdef