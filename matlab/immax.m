function If = immax(I)

% Cette fonction transforme l'image d'entr�e en niveau de gris gr^ce � la
% noorme infinie.

% I : image d'entr�e rgb

% If : image de sortie niveaux de gris

[m, n, ~] = size(I);
If = zeros(m, n);

for i = 1:m
    for j = 1:n
        If(i, j) = max(I(i, j, :));
    end
end

end