function pieces = couleur(I, tab)

% sert à mesurer la moyenne des couleurs des pièces

% I : image de pièces
% tab : tableau des centres et rayons de pièces

% pieces : tableau des centres, rayons et couleurs moyennes des pièces


[m, ~] = size(tab);
pieces = [tab, zeros(m, 3)];

for i = 1:m

    pieces(i, 4:9) = moyenne_couleur(I, tab(i, 1), tab(i, 2), tab(i, 3));

end

pieces

end