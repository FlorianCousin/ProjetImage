function grad = gradi(I)

Itsf = testScalaireFond(I);
Ilab = rgb2lab(Itsf);

Iflou = imfilter(double(Ilab(:,:,3)),fspecial('gaussian'),20,20);

[Gx,Gy] = imgradientxy(Ilab(:,:,3));

[Gmag, ~] = imgradient(Gx, Gy);

marqueur = imextendedmax(Iflou, 21);

% grad = marqueur;
% 
% figure;
% imshow(Ilab(:,:,3),[]);title('Ilab');


masque = watershed(imimposemin(1-Ilab(:,:,3), marqueur));

Origin = masque;

%Origin(masque == 0) = 0;
Origin = ~im2bw(Origin,0);


% Origin.size()
% marqueur.size()

marqueursTot = Origin + marqueur;

figure;
imshow(marqueursTot,[]);title('Marqueurs totaux');

water = watershed(imimposemin(Gmag, marqueursTot));

grad = water;

end

end