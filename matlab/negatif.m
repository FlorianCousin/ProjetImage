function If = negatif(I)

% Im est une image rgb représentant des pièces
% If est une image binaire qui correspond à la segmentation des pièces


[m, n, d] = size(I);
fond = zeros(1, d);
nbpix = 2 * m + 2 * n - 4;


for k = 1:d
    fond(k) = fond(k) + (sum(I(1, :, k)) + sum(I(m, :, k))) / nbpix;
    fond(k) = fond(k) + (sum(I(2:m-1, 1, k)) + sum(I(2:m-1, n, k))) / nbpix;
end

for i = 1:m
    for j = 1:n
        for k = 1:d
            I(i, j, k) = -I(i, j, k) + fond(k);
        end
    end
end

figure; imshow(I, []);

Igray = rgb2gray(I);

level = multithresh(Igray, 2);

It = im2bw(Igray, level(1));

%It = im2bw(rgb2gray(I), 0.15);

f_bw3 = imfill(imclose(It, strel('disk', 2)),'holes');

marqueur = imerode(f_bw3,strel('disk',30));

recons = imreconstruct(marqueur,f_bw3);

Ichepo = imopen(recons, strel('disk', 50));

Ichepo = imclearborder(Ichepo);

Issangle = zeros(size(Ichepo));

for i = 0:17
    Issangle = Issangle + Ichepo - imopen(Ichepo, strel('line', 50, 10 * i));
end

Issangle = im2bw(Ichepo - Issangle, 0.9);

If = Issangle;

end