function Issangle = segmentation(I)

% Im est une image rgb représentant des pièces
% If est une image binaire qui correspond à la segmentation des pièces


[m, n, ~] = size(I);

Ihsv = rgb2hsv(I);

Ihsv(:,:,2) = imadjust(Ihsv(:,:,2));

level = multithresh(Ihsv(:, :, 2), 4);
% figure();
% imhist(Ihsv(:, :, 2));
f_bw = zeros(m, n);
I1 = imbinarize(Ihsv(:,:,2), level(1));
I2 = imbinarize(detectCoinSilver(I), 0.5);
%f_bw = imbinarize(Ihsv(:,:,2), level(4)) || imbinarize(detectCoinSilver(I), 0.25);
for i = 1:m
    for j = 1:n
        f_bw(i, j) = I1(i, j) || I2(i, j);
    end
end

f_bw3 = imfill(imclose(I1, strel('disk', 2)),'holes');

marqueur = imerode(f_bw3,strel('disk',30));

recons = imreconstruct(marqueur,f_bw3);

Ichepo = imopen(recons, strel('disk', 50));

Ichepo = imclearborder(Ichepo);

Issangle = zeros(size(Ichepo));
for i = 0:17
    Issangle = Issangle + Ichepo - imopen(Ichepo, strel('line', 50, 10 * i));
end
Issangle = im2bw(Ichepo - Issangle, 0.9);

figure();
imshow(I2, []);

end