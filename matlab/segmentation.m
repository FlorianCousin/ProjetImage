function Issangle = segmentation(Im)

% Im est une image rgb représentant des pièces
% If est une image binaire qui correspond à la segmentation des pièces

grey = rgb2lab(I);

grey(:,:,2) = imadjust(grey(:,:,2) / max(max(grey(:,:,2))));

f_bw  = im2bw(grey(:,:,2), 0.2);

f_bw3 = imfill(imclose(f_bw, strel('disk', 2)),'holes');

marqueur = imerode(f_bw3,strel('disk',30));

recons = imreconstruct(marqueur,f_bw3);

Ichepo = imopen(recons, strel('disk', 50));

Issangle = zeros(size(Ichepo));
for i = 0:17
    Issangle = Issangle + Ichepo - imopen(Ichepo, strel('line', 50, 10 * i));
end
Issangle = im2bw(Ichepo - Issangle, 0.9);

end