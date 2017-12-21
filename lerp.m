function value = lerp(v, x)
    % Interpolare liniara unidimensionala
    %
    % Inputs
    % ------
    % v: un vector cu valorile functie
    % x: o noua pozitie in care sa se calculeze valoarea functiei

    %TODO

    m = length(v); % dimension of array
    xmin = floor(x); % left side of the interval where x belongs (x is in [xmin, xmin + 1])

    if (x < 1 || x >= m) % if x cannot be placed in any interval in array
        value = 0;
    else
        value = ((x - xmin) * (v(xmin + 1) - v(xmin))) + v(xmin);
    endif

endfunction