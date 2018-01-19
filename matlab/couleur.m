function pieces = couleur(I, tab)

% sert à mesurer la moyenne des couleurs des pièces

% I : image de pièces
% tab : tableau des centres et rayons de pièces

% pieces : tableau des centres, rayons et couleurs moyennes des pièces


[m, ~] = size(tab);
pieces = [tab, zeros(m, 3)]

for i = 1:m
    pieces(4 : 6) = moyenne_couleur(I, tab(m, 1), tab(m, 2), tab(m, 3));
end

pieces

end