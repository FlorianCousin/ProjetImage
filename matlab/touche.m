function If = touche(I)

% Cette fonction est cens�e segmenter l'image I

% I : image couleur dont les valeurs sont entre 0 et 1 et qui repr�sentent
% des pi�ces

% If : segmentation des pi�ces


Itsf = testScalaireFond(I);

Itlab = rgb2lab(Itsf);

Iplan = mat2gray(Itlab(:, :, 3));

level = multithresh(Iplan, 3);

Ibw = im2bw(Iplan, level(1));

Ifull = imfill(Ibw, 'holes'); 

clear = imclearborder(Ifull);

Ismooth = imopen(clear, strel('disk', 7));

Ismooth = imclose(Ismooth, strel('disk', 7));

%Iconvhull = bwconvhull(Ismooth, 'objects');

If = Ismooth;

% figure;
% imshow(I .* Ibw, []);

end