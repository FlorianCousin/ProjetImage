%% Projet Image
clear
close all;
clc;

%I = double(imread('..\comment\M4-C1_C5_E1_E2.jpg')) / 255;
%I = double(imread('..\set\set\C1_1.jpg')) / 255;
I = double(imread('..\Image Prof\20141020_112558 (1).jpg')) / 255;

%I = double(imread('..\comment\M4-C1_C5_E1_E2.jpg')) / 255;

%M8-C1_C2_C5_C10_C20_C50_E1_E2
%E1_2
%M4-C1_C5_E1_E2
%MC-M4_355c

figure;
imshow(I);

If = Fournier(I);
%If = touche(I);
%If = negatif(I);

figure;
imshow(If, []);
%%
[centers, radii] = imfindcircles(If, [140, 240], 'ObjectPolarity', 'bright', 'Method', 'TwoStage', 'Sensitivity', 0.95);

It = zeros(size(I));
It(:, :, 1) = If;
It(:, :, 2) = If;
It(:, :, 3) = If;

figure;
imshow(It, []); colorbar;
viscircles(centers, radii);
moyenne = [188.97,131.17,72.92,168.33,129.33,46.67];

[c, Ic] = ciecle(If, I, 0.0558, moyenne);
Ic

%%
It = zeros(size(I));

It(:, :, 1) = If;
It(:, :, 2) = If;
It(:, :, 3) = If;

[centers, radii] = imfindcircles(If, [140, 240], 'ObjectPolarity', 'bright', 'Method', 'TwoStage', 'Sensitivity', 0.95);

figure;
imshow(I.*It, []); colorbar;
viscircles(centers, radii);

% Id = identification(If);

Itot = jardinage(Id);

Itot

[m,~] = size(Itot)

for i= 1:m
    figure;
    imshow(If);
    center = [Itot(i,1),Itot(i,2)]
    ray = Itot(i,3)
    viscircles(center,ray);
end


% tic
% segmentation(I);
% toc
% 
% figure;
% imshow(I .* segmentation(I), []);

%%
grey = rgb2lab(I);
Ihsv = rgb2hsv(I);



figure;
imshow(grey(:, :, 3), [0,100]); title('Lab chiatique');

grey(:,:,3) = imadjust(grey(:,:,3) / max(max(grey(:,:,2))));
figure;
[counts,x] = imhist(grey(:,:,3)); title('histo');
figure;
bar(x,counts); title('barre');


f_bw  = im2bw(Ihsv(:,:,2), 0.3);
figure;
imshow(f_bw,[]);title('Image segmentée');

%imshow(Ihsv(:, :, 2));

%


%


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

Ichepo = imclearborder(Ichepo);

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
