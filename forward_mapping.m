function img_out = forward_mapping(img_in, T)
    % Creati o noua imagine prin aplicarea transformarii T pe imaginea
    % img_in (grayscale image), folosind forward mapping.
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

    [m, n] = size(img); % m rows, n columns

    if (T(1,1)^2 + T(2,1)^2 != 1 && (T(1,2) == 0) && (T(2,1) == 0)) % scaling
        for i = 1:m
            for j = 1:n
                poz1 = [i; j];
                poz = T * poz1; % compute positions

                % compute every element of scaled matrix
                image_matrix(round(poz(1) + 1), round(poz(2) + 1)) = img(i, j);
            endfor
        endfor        
    else % rotation

        % dimensions for the rotated image
        m_rot = abs(round(m * T(1, 1))) + abs(round(n * T(2,1)));
        n_rot = abs(round(m * T(2, 1))) + abs(round(n * T(1,1)));

        %midpoints for centering image
        mid_points = [round(m / 2); round(n / 2)];

        image_matrix = zeros(m_rot, n_rot); % scaled matrix

        for i = 1:m
            for j = 1:n
                    
                poz1 = [i; j];
                poz = T * (poz1 - mid_points); % compute positions

                % centering
                poz(1) = round(poz(1)) + round(m_rot / 2);
                poz(2) = round(poz(2)) + round(n_rot / 2);

                if ((poz(1) >= 1) && (poz(2) >= 1)) % if it is a valid position
                  image_matrix(poz(1), poz(2)) = img(i, j);         
                endif

            endfor
        endfor
    endif

    % imwrite(mat2gray(image_matrix), 'file_forward.png'); % create image

    img_out = image_matrix;

endfunction