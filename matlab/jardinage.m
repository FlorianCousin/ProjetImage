function tab = jardinage(tabg)

% Cette fonction enlève les cercles de tabg qui semblent incorrects, cà
% dont leur centre est inclu dans un autre cercle et qui est plus petit

% tabg : tableau de cercles
%        trois colonnes : abcsisse centre, ordonnée centre, rayon

% tab : tabg dont on a enlevé des cercles

tabg = sortrows(tabg, 3);
[m, ~] = size(tabg);
tab = 0;

for i = 1:m
    for j = i+1:m
        if distance(tabg(i, 1), tabg(j, 1), tabg(i, 2), tabg(j, 2)) < tabg(i, 3) + tabg(j, 3)
            tab = ajouterLigne(tab, tabg(i, :));
        end
    end
end

end