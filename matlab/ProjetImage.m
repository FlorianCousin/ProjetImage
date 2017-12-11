%% Projet Image
clear
close all;


I = double(imread('../images/C1_1.jpg')) / 255;

imshow(I);

%% Calibrage

i = CalibrateCoin('C1');
