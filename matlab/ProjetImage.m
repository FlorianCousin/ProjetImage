%% Projet Image
clear
close all;

I = double(imread('../images/E2_1.jpg')) / 255;

figure;
imshow(I);

grey = rgb2lab(I);

% strel('disk',10);
% ferm = imclose(grey,strel);
% figure;
% imshow(ferm);title('fermeture');
% 
% I = ferm - grey;
% figure;
% imshow(I);title('ferme');


figure;
imshow(grey(:, :, 3), [0,100]); title('Lab chiatique');

grey(:,:,3) = imadjust(grey(:,:,3) / max(max(grey(:,:,2))));
figure;
[counts,x] = imhist(grey(:,:,3)); title('histo');
figure;
bar(x,counts); title('barre');


f_bw  = im2bw(grey(:,:,3), 0.7);
figure;
imshow(f_bw,[]);title('Image segment�e');
%%
close all;
f_bw3 = imfill(imclose(f_bw, strel('disk', 2)),'holes');
figure;
imshow(f_bw3,[]); title('Image sans trous');

marqueur = imerode(f_bw3,strel('disk',30));
figure;
imshow(marqueur,[]); title('Image marqueurs');

recons = imreconstruct(marqueur,f_bw3);
figure;
imshow(recons,[]); title('Image reconstruite');

Ichepo = imopen(recons, strel('disk', 50));
figure;
imshow(Ichepo,[]); title('Image chepo');

% tic
% Icercle = cercle(recons);
% toc
% figure;
% subplot(1, 2, 1); imshow(Icercle,[]); title('Image cercle');

% hough voting
% Icer = hough(Ichepo);
% subplot(1, 2, 2); imshow(Icer,[]); title('Image cercle');

% Issangle = zeros(size(Icercle));
% for i = 0:7
%     Issangle = Issangle + Icercle - imopen(Icercle, strel('line', 30, 11.25 + 22.5 * i));
% end
% Issangle = Icercle - Issangle;
% subplot(1, 2, 2); imshow(Issangle,[]); title('Image cercle');

Issangle = zeros(size(Ichepo));
tic
for i = 0:17
    Issangle = Issangle + Ichepo - imopen(Ichepo, strel('line', 50, 10 * i));
end
Issangle = im2bw(Ichepo - Issangle, 0.9);
toc
subplot(1, 2, 2); imshow(Issangle,[]); title('Image cercle');

If = Issangle .* I;
figure;
imshow(If,[]); title('Image sans fond');


%%
% s = strel('disk',5);
% fer = imclose(recons,s);
% figure;
% imshow(fer,[]); title('Image fermeture');
% 
% ouv = imopen(fer,s);
% figure;
% imshow(ouv,[]); title('Image ouverture');
% 
% 
% f_label = bwlabel(ouv);
% figure;
% imshow(label2rgb(f_label),[]); title('Image label');
% 
% 
% %% Calibrage
% 
% i = CalibrateCoin('C1');
%%
I = double(imread('../comment/M3-C1_C2_C5.jpg'))/255;

figure;
imshow(I);

Im = segmentation(I);

figure;
imshow(Im);
