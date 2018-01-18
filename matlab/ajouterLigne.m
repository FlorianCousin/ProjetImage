function tab = ajouterLigne(taba, ligne)

% Permet d'ajouter une ligne à taba, et si taba est vide, alors on le crée.

% taba : tableau de lignes (peut être vide, càd de taile [1 1])
% ligne : ligne à ajouter dans taba

% tab : taba dans lequel on a ajouté ligne

[m, n] = size(taba);

if m == 1 && n == 1
    tab = ligne;
else
    tab = [taba; ligne];
end

end