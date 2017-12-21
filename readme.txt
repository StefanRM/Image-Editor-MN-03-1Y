Metode Numerice - Tema 3
Maftei Stefan - Radu
Grupa 314CD

1) lerp()

	Aceasta functie calculeaza interpolarea liniara. Vectorul v contine valorile
functiei, iar x este punctul in care vrem sa calculam valoarea functiei, valoare
ce se afla pe segmentul de dreapta dintre doua puncte intre care se afla.
	Daca x nu poate fi plasat intr-un interval din vector, atunci valoarea in
acel punct e 0.
	Pentru implementare am aflat capatul din stanga al intervalului (capatul din
dreapta este cu 1 mai mare). Apoi verific daca exista un interval in care se afla
(daca nu se afla in afarea punctelor din vector). Formula folosita este dedusa din
ecuatia dreptei.

2) bilerp()

	Aceasta functie calculeaza interpolarea biliniara. Aflam dimensiunile matricii si
daca randul si coloana unde vrem sa aflam valoarea se afla in matrice.
Aflam randul mai mic sau egal decat row si aflam R1, R2 cu functia lerp, aplicand
pe randul mai mic sau egal cu row si randul urmator.
	Valoarea finala se calculeaza tot cu lerp(). Stiind valorile R1 si R2, aplicam
interpolarea liniara pe vectorul cu valorile R1 si R2. Vrem sa calculam valoarea in
punctul dintre randul mai mic sau egal cu row si row. Pentru ca indicii in vector sunt
1, 2, 3... vom aduna 1 acestei valori pentru a nu fi in afara intervalului.

3) forward_mapping()

	Citim matricea img a imaginii si retinem dimensiunile ei. Verificam daca e vorba
de o scalare sau de o rotatie. Singurul lucuru comun in conditie amandurora este 
formula sin(x) ^ 2 + cos(x) ^ 2 = 1 pentru cazul cand cos x = 1, dar acest caz 
inseamna scalare cu 1 sau rotire cu 0 grade, ceea ce e acelasi lucru, deci nu 
conteaza pe ce ramura merge rezolvarea.
	Pentru scalare efectuam inmultirea matricii de transformare T cu vectorul de 
pozitie ([i; j]) al pixelului. Aproximam pozitia pentru ca se poate sa dea subunitar 
si adaugam 1, deoarece indicii matricilor sunt 1, 2, 3... Asignam acestei pozitii 
valoarea din matricea img a imaginii.
	Pentru rotire aflam dimensiunile noii imagini rotite. Folosim valoarea absoluta
ca sa nu avem surprize din cauza valorilor negative. Formula a fost dedusa folosind
un dreptunghi care are un colt in origine si se roteste in sens trigonometric.
	Ca sa ramana centrata imaginea avem nevoie de puncte de mijloc (midpoints).
Pentru fiecare pixel calculam pozitia din matricea rotita folosind matricea de 
transformare T, tinand cont de punctele de mijloc. Apoi centram imaginea.
	Pentru ca se pot obtine valori zero sau negative, vom insera pentru aceastea
valoarea zero in matricea rotita, si valorea corespunzatoare (calculata) in rest.

4) inverse_mapping()

	Citim matricea img a imaginii si retinem dimensiunile ei. Calculam inversa 
matricii de transformare T. Ca la forward_mapping() verificam cazurile de scalare
sau rotire. Calculam dimensiunile matricii de scalare si apoi pentru fiecare poztie
din imaginea scalata calculam cu ajutorul inversei T^(-1) pozitiile unde vrem sa 
interpolam. Astfel daca valorile pozitiilor sunt mai mari ca 0 (sa se afle in vreun 
interval) calculam interpolarea biliniara pentru pozitiile determinate si inseram in
locul corespunzator in matricea scalata (imaginea scalata).
	Pentru matricea rotita calculam dimensiunile acesteia. De data aceasta punctele
de mijloc le calculam in functie de dimensiunile matricii rotite, nu a matricii 
imaginii. Pentru fiecare pozitie din matricea rotita calculam pozitiile de interpolat
cu ajutorul matricii T^(-1), tinand cont de punctele de mijloc, centram si apoi, daca
pozitia este valida efectuam interpolarea biliniara si adaugam rezultatul pe pozitia
corespunzatoare in matricea rotita. Daca pozitia nu e valida valoarea in pozitia
respectiva este 0 (matricea a fost initializata).

5) demo()

	Functia aceasta are rolul de a testa inverse_mapping() pe imaginile
'flapping_bird.png' si 'flapping_duck.png'. Se vor testa transformarile rotire fata
de orizontala, scalare cu 0.4 si rotatie cu 45 de grade in sens trigonometric.
	Vor rezulta 6 poze care vor fi puse in folder-ul /demo, avand nume sugestive in
functie de poza utilizata si de criteriul testat.