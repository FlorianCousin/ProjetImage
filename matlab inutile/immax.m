function If = immax(I)

% Cette fonction transforme l'image d'entrée en niveau de gris grâce à la
% norme infinie.

% I : image d'entrée rgb

% If : image de sortie niveaux de gris

[m, n, ~] = size(I);
If = zeros(m, n);

for i = 1:m
    for j = 1:n
        If(i, j) = max(I(i, j, :));
    end
end

end