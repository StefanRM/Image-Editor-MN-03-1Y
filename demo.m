function demo()
	% Functia are rolul de a testa inverse_mapping() pe imaginile
	% flapping_bird.png si flapping_duck.png, testand cazurile prezentate
	% in enunt.
	% Imaginile rezultate se afla in folderul /demo

	% flapping_bird.png
	img_1 = inverse_mapping('flapping_bird.png', [-1 0; 0 -1]); % rotire fata de orizontala
	img_2 = inverse_mapping('flapping_bird.png', [0.4 0; 0 0.4]); % scalare cu 0.4
	img_3 = inverse_mapping('flapping_bird.png', [1/(sqrt(2)) -1/(sqrt(2)); 1/(sqrt(2)) 1/(sqrt(2))]); % rotatie cu 45 de grade in sens trigonometric

	imwrite(mat2gray(img_1), 'demo/flapping_bird_img_1.png');
	imwrite(mat2gray(img_2), 'demo/flapping_bird_img_2.png');
	imwrite(mat2gray(img_3), 'demo/flapping_bird_img_3.png');

	% flapping_duck.png
	img_1 = inverse_mapping('flapping_duck.png', [-1 0; 0 -1]); % rotire fata de orizontala
	img_2 = inverse_mapping('flapping_duck.png', [0.4 0; 0 0.4]); % scalare cu 0.4
	img_3 = inverse_mapping('flapping_duck.png', [1/(sqrt(2)) -1/(sqrt(2)); 1/(sqrt(2)) 1/(sqrt(2))]); % rotatie cu 45 de grade in sens trigonometric

	imwrite(mat2gray(img_1), 'demo/flapping_duck_img_1.png');
	imwrite(mat2gray(img_2), 'demo/flapping_duck_img_2.png');
	imwrite(mat2gray(img_3), 'demo/flapping_duck_img_3.png');


endfunction