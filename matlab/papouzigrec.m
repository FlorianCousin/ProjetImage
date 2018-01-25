clear;
close all;
clc;

files = dir('../comment');

files = files(3:size(files)-1);

nbFiles = size(files);



for i = 1:nbFiles
    files(i).name
    I = double(imread(strcat('../comment/', files(i).name))) /255;
    neg = negatif(I);
    moy = [188.97,131.17,72.92,168.33,129.33,46.67];
    [compte, result] = ciecle(neg, I, 0.0558, moy);
    figure; imshow(I, []);
    for j = 1:size(result)
        viscircles(result(1:2), result(3));
        text(result(1), result(2), num2str(result(4)));
    end
end