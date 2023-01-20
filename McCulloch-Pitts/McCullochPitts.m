classdef McCullochPitts
  properties
    weights = 0;
    ttable = [];
    theta = 0;  % Also threshold
  endproperties
  
  methods
    function self = McCullochPitts(w, th)
      self.weights = w;
      self.theta = th;
    endfunction

    function self = set_weights(obj, w)
      self = obj;
      self.weights = w;
    endfunction

    function self = set_theta(obj, t)
      self = obj;
      self.theta = t;
    endfunction

    function self = create_table(obj, size_)
      self = obj;
      numbers = 0: (2 ^ size_) - 1;
      binaries = dec2bin(numbers);
      self.ttable = zeros((2 ^ size_) - 1, size_);
      for i = 1:(2 ^ size_)
        for j = 1:size_
          self.ttable(i, j) = str2num(binaries(i, j));
        end
      end
    endfunction

    function success = not(self)
      self.ttable = [1 0; 0 1];                 % Create table
      times = self.ttable(1, :) * self.weights; % Times x * w
      target = self.ttable(:, end);             % Copy exit table
      arr = times > self.theta;                 % Function `S`
      if sum(flip(arr == target')) == 2
        success = logical(1);
      else
        success = logical(0);
      end
    endfunction

    function success = and(self, size_)
      self = create_table(self, size_); % Create table
      target = zeros(1,(2 ^ size_));    % Set logical target
      target(end) = 1;
      s = fit(self, target);            % Compute result
      if sum(s) == size_
        success = logical(1);
      else
        success = logical(0);
      end
    endfunction

    function success = or(self, size_)
      self = create_table(self, size_); % Create table  
      target = ones(1,(2 ^ size_));     % Set logical target
      target(1) = 0;
      s = fit(self, target);            % Compute result
      if sum(s) == size_
        success = logical(1);
      else
        success = logical(0);
      end
    endfunction

    function s = fit(self, target)  % Compute result
      xw = self.weights .* self.ttable;
      xw = sum(xw, 2);
      arr = xw > self.theta;
      s = arr == target';
    endfunction

    function save(self) % Save information into file
      name = input("Name file: ", "s");
      if numel(strsplit(name, ".")) < 2
        name = strcat(name, ".txt")
      endif
      vo = fopen(name, "w");
      fprintf(vo, "weigths:\n");
      for i = 1:numel(self.weights)
        fprintf(vo, "%d ", self.weights(i));
      end
      fprintf(vo,'\n\nthreshold:\n%d\n', self.theta);
      fclose(vo);
    endfunction
  endmethods
endclassdef  
  