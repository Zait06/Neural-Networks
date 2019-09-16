function [ep]=ErrorEpoca(e)
    % Calcula el error por epoca, el cual es un promedio
    ep=(1/numel(e))*(sum(e));
end