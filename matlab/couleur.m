function pieces = couleur(I, tab)

% sert à mesurer la moyenne des couleurs des pièces

% I : image de pièces
% tab : tableau des centres et rayons de pièces

% pieces : tableau des centres, rayons et couleurs moyennes des pièces


[m, ~] = size(tab);
pieces = [tab, zeros(m, 1)];

for i = 1:m
    pieces(3) = moyenne_couleur(I, tab(m, 1), tab(m, 2));
end

end