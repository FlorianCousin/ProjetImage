function If = touche(I)

% Cette fonction est censée segmenter l'image I

% I : image couleur dont les valeurs sont entre 0 et 1 et qui représentent
% des pièces

% If : segmentation des pièces


Itsf = testScalaireFond(I);

Itlab = rgb2lab(Itsf);

Iplan = imadjust(mat2gray(Itlab(:, :, 3)));

level = multithresh(Iplan, 4);

Ibw = imbinarize(Iplan, level(1));

Ifull = imfill(Ibw, 'holes');

Ismooth = imopen(Ifull, strel('disk', 5));

Ismooth = imclose(Ismooth, strel('disk', 5));

%If = bwconvhull(Ismooth, 'objects');
If = Ismooth;

end