function moy = moyenne_couleur(I, center, radii)

% Calcule la moyenne dans un cercle de l'image
% Le cercle est forc�ment enti�rement

% Image
% center : centre du cercle
% radii : rayon du cercle

% moy : moyenne des pixels de I dans le cercle

som = zeros(1, 3);
nbpix = 0;

for i = center(1) - radii:center(1) + radii
    for j = center(2) - radii:center(2) + radii
        if distance(center(1), center(2), i, j) < radii
            nbpix = nbpix + 1;
            som = som + I(i, j);
        end
    end
end

end