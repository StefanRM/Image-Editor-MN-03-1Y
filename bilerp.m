function value = bilerp(img, row, col)
    % Folositi interpolare biliniara pentru a estima intensitatea imaginii
    % in pozitia row, col

    %TODO

    [m n] = size(img); % m rows, n columns

    if ((row < 1) || (row >= m) || (col < 1) || (col >= n)) % if row or col are out of bounds of img's indices
    	value = 0;
    else
    	row_min = floor(row); % left side of the interval for finding R1

    	% computing R1 & R2 with lerp()
    	R1 = lerp(img(row_min, :), col);
    	R2 = lerp(img(row_min + 1, :), col);

    	% final computing with lerp which results in the bilerp() solution
    	value = lerp([R1 R2], row - row_min + 1);
    endif

endfunction