clc; clear all; close all;

f = imread('../Dataset/20141020_112537.jpg');
figure;imshow(f,[]);

%%
% background = imopen(f,strel('disk',21));
% I2 = f - background;
% figure;imshow(I2);
%
f_lab = rgb2lab(f);
figure; imshow(squeeze(f_lab(:,:,1)),[]);
figure; imshow(squeeze(f_lab(:,:,2)),[]);
figure; imshow(squeeze(f_lab(:,:,3)),[]);
f_lab(:,:,1) = imadjust(f_lab(:,:,1)/max(max(f_lab(:,:,1))));
% I3 = lab2rgb(f_lab);
% I3(:,:,1) = imadjust(f(:,:,1));
% I3(:,:,2) = imadjust(f(:,:,2));
% I3(:,:,3) = imadjust(f(:,:,3));
figure;imshow(I3);

%%

f_l = f(:,:,1);
[counts,x] = imhist(f_l);
figure; bar(x,counts);
f_bw  = im2bw(f_l,graythresh(f_l));
% f_bw = imfill(f_bw,'holes');
figure; imshow(f_bw,[]);
f_bw = imcomplement(f_bw);
f_bw3 = imfill(f_bw,'holes');
figure;imshow(f_bw);
figure;imshow(f_bw3);
f_bw4 = imclose(f_bw3,strel('disk',10));
figure;imshow(f_bw4);


f_label = bwlabel(f_bw4);
figure;imshow(f_label,[]);

figure;imshow(label2rgb(f_label),[]);


% fr = f(:,:,1); fv = f(:,:,2); fb = f(:,:,3);
% figure, plot3(fr(:),fv(:),fb(:),'.'); grid('on')
% title('Nuage de points 3D');
% xlabel('Rouge'); ylabel('Vert'); zlabel('Bleu');

he = f(800:2400,600:2400,:);
he = imfilter(he, fspecial('average', 9));

% cform = makecform('srgb2lab');
% lab_he = applycform(he,cform);
% ab = double(lab_he(:,:,2:3));

ab = double(he);

nrows = size(ab,1);
ncols = size(ab,2);
ab = reshape(ab,nrows*ncols,3);
nColors = 10;

% repeat the clustering 3 times to avoid local minima
[cluster_idx, cluster_center] = kmeans(ab,nColors,'distance','sqEuclidean', ...
                                      'Replicates',3);
pixel_labels = reshape(cluster_idx,nrows,ncols);
figure; imshow(label2rgb(pixel_labels),[]);
title('image labeled by cluster index');