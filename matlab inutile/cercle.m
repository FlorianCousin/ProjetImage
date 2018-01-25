function Ic = cercle(Im)

% Im est une image binaire représentant un cercle pas beau.
% Cet algorithme renvoie le plus grand cercle inscrit dans le cercle pas
% beau.

r = 150;
Itmp = imopen(Im,strel('disk',r));
Ic = Itmp;
conn = bwconncomp(Im, 8);


while sum(sum(Itmp)) > 0
    r = r+1;
    Ic = Itmp;
    Itmp = imopen(Im,strel('disk',r, 8));
 
end

end