function If = negatif(I)

% Cette fonction permet de binariser et d'extraire les pièces d'une image.
% On passe d'abord l'image en négatif.
% Im est une image rgb représentant des pièces
% If est une image binaire qui correspond à la segmentation des pièces


[m, n, d] = size(I);
fond = zeros(1, d);
nbpix = 2 * m + 2 * n - 4;

% on récupère la moyenne du fonc en faisant la moyenne de tous les pixels
% du contour de l'image
for k = 1:d
    fond(k) = fond(k) + (sum(I(1, :, k)) + sum(I(m, :, k))) / nbpix;
    fond(k) = fond(k) + (sum(I(2:m-1, 1, k)) + sum(I(2:m-1, n, k))) / nbpix;
end

% On enlève le fond et on passe en négatif chaque canal
for i = 1:m
    for j = 1:n
        for k = 1:d
            I(i, j, k) = -I(i, j, k) + fond(k);
        end
    end
end

% On passe en niveaux de gris
Igray = rgb2gray(I);

% On seuille avec 3 intervalles
level = multithresh(Igray, 2);

% On segmente entre la première intervalle et les deux autres
It = im2bw(Igray, level(1));

% On bouche les trous
f_bw3 = imfill(imclose(It, strel('disk', 2)),'holes');

% On fait des marqueurs pour supprimer les tout petits artéfacts
marqueur = imerode(f_bw3,strel('disk', 30));

% On reconstruit par dilatation
recons = imreconstruct(marqueur,f_bw3);

% On effetcue une ouverture
Ichepo = imopen(recons, strel('disk', 50));

% On supprime les bords
Ichepo = imclearborder(Ichepo);

Issangle = zeros(size(Ichepo));

% On arrondie les angles
for i = 0:17
    Issangle = Issangle + Ichepo - imopen(Ichepo, strel('line', 50, 10 * i));
end

Issangle = im2bw(Ichepo - Issangle, 0.9);

If = Issangle;

end