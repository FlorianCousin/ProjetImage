%% Projet Image
clear
close all;

I = double(imread('../images/C2_1.jpg')) / 255;

figure;
imshow(I);

grey=rgb2lab(I);

figure;
imshow(grey(:,:,2),[0,100]);title('Lab chiatique');

grey(:,:,2) = imadjust(grey(:,:,2)/max(max(grey(:,:,2))));
figure;
[counts,x]=imhist(grey(:,:,2));title('histo');
figure;
bar(x,counts);title('barre');


f_bw  = im2bw(grey(:,:,2), 0.2);
figure;
imshow(f_bw,[]);title('Image segmentée');
%%
close all;
f_bw3 = imfill(f_bw,'holes');
figure;
imshow(f_bw3,[]);title('Image sans trous');

marqueur=imerode(f_bw3,strel('disk',30));
figure;
imshow(marqueur,[]);title('Image marqueurs');

recons=imreconstruct(marqueur,f_bw3);
figure;
imshow(recons,[]);title('Image reconstruite');

Icercle = cercle(recons);
figure;
imshow(Icercle,[]);title('Image cercle');
%%
s=strel('disk',5);
fer=imclose(recons,s);
figure;
imshow(fer,[]);title('Image fermeture');

ouv=imopen(fer,s);
figure;
imshow(ouv,[]);title('Image ouverture');


f_label = bwlabel(ouv);
figure;
imshow(label2rgb(f_label),[]);title('Image label');


%% Calibrage

i = CalibrateCoin('C1');



