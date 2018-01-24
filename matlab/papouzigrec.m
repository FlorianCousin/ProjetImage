clear;
close all;
clc;

files = dir('../comment');
%files = files.name;
files = files(3:size(files)-1);

nbFiles = size(files);



for i = 1:nbFiles
    I = imread('../comment' + files(i).name);
    negatif(I);
    [compte, result] = ciecle(negatif(I), I, 0.0558, [188.97,131.17,72.92,168.33,129.33,46.67]);
    figure; imshow(I, []);
    for j = 1:size(result)
        text(result(1), result(2), result(4));
    end
end