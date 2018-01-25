function d3D = distance_3D (x,y,z,x2,y2,z2)
% Fonction permettant de calculer la distance entre les moyennes théoriques
% des couleurs et celles trouvées dans l'image.
% x = moyenne couleur R théorique
% y = moyenne couleur V théorique
% z = moyenne couleur B théorique
% x2 = moyenne couleur R de la pièce
% y2 = moyenne couleur V de la pièce
% z2 = moyenne couleur B de la pièce


d3D = sqrt((x2 - x)^2 + (y2 - y)^2 + (z2 - z)^2);

end