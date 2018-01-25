function d3D = distance_3D (x,y,z,x2,y2,z2)
% Fonction permettant de calculer la distance entre les moyennes th�oriques
% des couleurs et celles trouv�es dans l'image.
% x = moyenne couleur R th�orique
% y = moyenne couleur V th�orique
% z = moyenne couleur B th�orique
% x2 = moyenne couleur R de la pi�ce
% y2 = moyenne couleur V de la pi�ce
% z2 = moyenne couleur B de la pi�ce


d3D = sqrt((x2 - x)^2 + (y2 - y)^2 + (z2 - z)^2);

end