clear;
close all;

I = double(imread('../images origine/IMG_20171210_195428.jpg')) / 255;


figure;
imshow(I);

I = permute(I, [2, 1, 3]);
figure;
imshow(I);


I = I(:, 1:1800, :);

%%
figure;
imshow(I);
imwrite(I,'M2-C5_C50_E1.jpg','jpg');