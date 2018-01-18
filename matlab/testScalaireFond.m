function If = testScalaireFond(I)

% I est une image couleur avec des valeurs entre 0 et 1

[m, n, ~] = size(I);
nbpix = 2 * m + 2 * n - 4;

moy = zeros(1, 3);

for i = 1:3
    moy(i) = sum(I(1, :, i)) + sum(I(m, :, i)) + sum(I(2:m-1, 1, i)) + sum(I(2:m-1, n, i));
    moy(i) = moy(i) / nbpix;
end

v = zeros(1, 1, 3);
v(1, 1, 1) = moy(1);
v(1, 1, 2) = moy(2);
v(1, 1, 3) = moy(3);
If = zeros(m, n);

for i = 1:m
    for j = 1:n
        coef = (log(3) - log(I(i, j, 1) * v(1, 1, 1) + I(i, j, 2) * v(1, 1, 2) + I(i, j, 3) * v(1, 1, 3))) / log(3);
        for k = 1:3
            If(i, j, k) = I(i, j, k) * coef;
        end
    end
end

end