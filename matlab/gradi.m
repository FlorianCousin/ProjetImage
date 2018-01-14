function grad = gradi(I)
Itsf = testScalaireFond(I);

Itlab = rgb2lab(Itsf);

Iplan = imadjust(mat2gray(Itlab(:, :, 3)));

level = multithresh(Iplan, 4);

Ibw = im2bw(Iplan, level(1));

clear = imclearborder(Ibw);

[Gx,Gy] = imgradientxy(Ibw);

[Gmag, Gdir] = imgradient(Gx, Gy);

% Ifull = imfill(Gmag, 'holes');
% 
% Ismooth = imopen(Ifull, strel('disk', 7));
% 
% Ismooth = imclose(Ismooth, strel('disk', 6));

grad = Gmag;

