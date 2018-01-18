function grad = gradi(I)

Ilab = rgb2lab(I);

Ilabp = imgaussfilt(Ilab(:, :, 3), 4);

[Gx,Gy] = imgradientxy(Ilabp);

[Gmag, ~] = imgradient(Gx, Gy);

level = multithresh(Gmag, 2);

Ibw = imbinarize(Gmag, level(1));

grad = Ibw;

figure;
imhist(Ilabp);

end