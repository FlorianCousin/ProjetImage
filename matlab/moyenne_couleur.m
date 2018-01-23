function [moy, sigma] = moyenne_couleur(I, xcenter, ycenter, radii)

% Calcule la moyenne dans un cercle de l'image
% Le cercle est forcément entièrement

% Image
% xcenter :  abcsisse du centre du cercle
% ycenter : ordonnée du centre du cercle
% radii : rayon du cercle

% moy : moyenne des pixels de I dans le cercle
% sigma : écart-type

som = zeros(1, 3);
nbpix = 0;

for i = ceil(ycenter - radii) : floor(ycenter + radii)
    for j = ceil(xcenter - radii) : floor(xcenter + radii)
        if distance(ycenter, xcenter, i, j) < radii
            nbpix = nbpix + 1;
            for k = 1:3
                som(k) = som(k) + I(i, j, k);
            end
        end
    end
end

if (nbpix == 0)
    nbpix = 1;
end
moy = som * 255 / nbpix

som = zeros(1, 3);

for i = ceil(ycenter - radii) : floor(ycenter + radii)
    for j = ceil(xcenter - radii) : floor(xcenter + radii)
        if distance(xcenter, ycenter, i, j) < radii
            for k = 1:3
                som(k) = som(k) + (I(i, j, k) - moy(k))^2;
            end
        end
    end
end

sigma = som / nbpix

end