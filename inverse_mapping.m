function img_out = inverse_mapping(img_in, T)
    % Creati o noua imagine prin aplicarea transformarii T pe imaginea
    % img_in (grayscale image), folosind inverse mapping si interpolare
    % biliniara
    %
    % Inputs
    % ------
    % img_in: imaginea care trebuie sa fie transformata.
    %      T: transformarea care trebuie aplicata asupra imaginii.
    %         matrice de 2x2.
    %
    % Outputs
    % -------
    % img_out: imaginea transformata (grayscale).

    %TODO

    img = imread(img_in); % open image

    % computing inverse of T
    T_inv_helper = [T(2, 2) -T(1, 2); -T(2, 1) T(1, 1)];
    T_inv = (1 / (T(1, 1) * T(2, 2) - T(1, 2) * T(2, 1))) .* T_inv_helper;

    [m, n] = size(img); % m rows, n columns

    if (T(1,1)^2 + T(2,1)^2 != 1 && (T(1,2) == 0) && (T(2,1) == 0)) % scaling

        % dimensions for the scaled image
        m_scal = m * T(1, 1);
        n_scal = n * T(2, 2);

        image_matrix = zeros(m_scal, n_scal); % scaled matrix

        for i = 1:m_scal
            for j = 1:n_scal
                poz1 = [i; j];
                poz = T_inv * poz1; % compute positions

                % compute every element of scaled matrix
                if (poz(1) > 0 && poz(2) > 0)
                    image_matrix(i, j) = bilerp(img, poz(1), poz(2)); % interpolate
                else % if negative element
                    image_matrix(i, j) = 0;
                endif
            endfor
        endfor        
    else % rotation

        % dimensions for the rotated image
        m_rot = abs(round(m * T(1, 1))) + abs(round(n * T(2,1)));
        n_rot = abs(round(m * T(2, 1))) + abs(round(n * T(1,1)));

        %midpoints for centering image
        mid_points = [round(m_rot / 2); round(n_rot / 2)];

        image_matrix = zeros(m_rot, n_rot); % scaled matrix

        for i = 1:m_rot
            for j = 1:n_rot
                    
                poz1 = [i; j];
                poz = T_inv * (poz1 - mid_points); % compute positions

                % centering
                poz(1) = round(poz(1)) + m/2;
                poz(2) = round(poz(2)) + n/2;

                if ((poz(1) >= 1) && (poz(2) >= 1) && (poz(1) <= m) && (poz(2) <= n)) % if it is a valid position
                  image_matrix(i, j) = bilerp(img, poz(1), poz(2)); % interpolate
                endif

            endfor
        endfor

    endif

    % imwrite(mat2gray(image_matrix), 'file_inversed.png'); % create image

    img_out = image_matrix;

endfunction