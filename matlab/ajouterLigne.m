function tab = ajouterLigne(taba, ligne)

% Permet d'ajouter une ligne � taba, et si taba est vide, alors on le cr�e.

% taba : tableau de lignes (peut �tre vide, c�d de taile [1 1])
% ligne : ligne � ajouter dans taba

% tab : taba dans lequel on a ajout� ligne

[m, n] = size(taba);

if m == 1 && n == 1
    tab = ligne;
else
    tab = [taba; ligne];
end

end