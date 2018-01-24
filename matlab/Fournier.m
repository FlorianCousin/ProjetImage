function If = Fournier(I)

% Im est une image rgb représentant des pièces
% If est une image binaire qui correspond à la segmentation des pièces

Ihsv = rgb2hsv(testScalaireFond(I));
Ifft = fftshift(fft2(Ihsv(:, :, 3)));

[m, n, ~] = size(I);

Filtre = ones(m, n);

Filtre(floor(4 * m / 10) + 1 : floor(6 * m / 10), floor(4 * n / 10) + 2 : floor(6 * n / 10)) = zeros(floor(m / 5), floor(n / 5));

Iffft = Ifft .* Filtre;

If = abs(ifft2(ifftshift(Iffft)));

level = multithresh(If, 5);
If = im2bw(If, level(1));

for i = 1:2
    If = imopen(If, strel('disk', i));
    If = imclose(If, strel('disk', i));
end
    

% If = imclose(If, strel('disk', 30));
% 
% If = imclose(If, strel('disk', 30));

If = imclearborder(If);

intervalle = zeros(19, 19);
intervalle(1, :) = -1 * ones(1, 19);
intervalle(19, :) = -1 * ones(1, 19);
intervalle(:, 1) = -1 * ones(19, 1);
intervalle(:, 19) = -1 * ones(19, 1);
intervalle(10, 10) = 1;

If = If - bwhitmiss(If, intervalle);

If = imclose(If, strel('disk', 20));

If = imfill(If, 'holes');

% If = bwconvhull(If, 'objects');
% 
% for i = 1:20
%     If = imclose(If, strel('disk', 30));
% 
%     If = bwconvhull(If, 'objects');
% end

end