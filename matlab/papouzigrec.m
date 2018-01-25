clear;
close all;
clc;

files = dir('../comment');
%files = files.name;
files = files(3:size(files)-1);

nbFiles = size(files);



for i = 1:nbFiles
    I = double(imread(strcat('../comment/', files(i).name))) / 255;
    neg = negatif(I);
    moy = [188.97,131.17,72.92,168.33,129.33,46.67];
    [compte, result] = ciecle(neg, I, 0.0558, moy);
    figure; imshow(I, []); title(files(i).name);
    [m, ~] = size(result);
    for j = 1:m
        viscircles(result(j, 1:2), result(j, 3));
        text(result(j, 1), result(j, 2), num2str(result(j, 4)));
    end
end