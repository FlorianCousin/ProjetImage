function moy = moyenne_couleur(I, xcenter, ycenter, radii)

% Calcule la moyenne dans un cercle de l'image
% Le cercle est forc�ment enti�rement

% Image
% xcenter :  abcsisse du centre du cercle
% ycenter : ordonn�e du centre du cercle
% radii : rayon du cercle

% moy : moyenne des pixels de I dans le cercle

som = zeros(1, 3);
nbpix = 0;

for i = xcenter - radii : xcenter + radii
    for j = ycenter - radii : ycenter + radii
        if distance(xcenter, ycenter, i, j) < radii
            nbpix = nbpix + 1;
            som = som + I(i, j, :);
        end
    end
end

moy = som / nbpix;

end