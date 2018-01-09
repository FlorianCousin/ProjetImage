function Issangle = segmentation(I)

% Im est une image rgb représentant des pièces
% If est une image binaire qui correspond à la segmentation des pièces




Ihsv = rgb2hsv(I);

Ihsv(:,:,3) = imadjust(Ihsv(:,:,2) / max(max(Ihsv(:,:,2))));

f_bw  = im2bw(Ihsv(:,:,2), 0.3);

f_bw3 = imfill(imclose(f_bw, strel('disk', 2)),'holes');

marqueur = imerode(f_bw3,strel('disk',30));

recons = imreconstruct(marqueur,f_bw3);

Ichepo = imopen(recons, strel('disk', 50));

Ichepo = imclearborder(Ichepo);

Issangle = zeros(size(Ichepo));
for i = 0:17
    Issangle = Issangle + Ichepo - imopen(Ichepo, strel('line', 50, 10 * i));
end
Issangle = im2bw(Ichepo - Issangle, 0.9);

end