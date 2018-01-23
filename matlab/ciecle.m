function compte = ciecle(mat, origin, scale)

% Cette fonction permet de distinguer les différentes pièces d'une image en
% comparant sa taille et sa couleur par rapport aux moyennes théoriques
% calculées auparavant. 

% compte : Nombre comptant le montant total des pièces d'une image (en
% euros)
%
% mat : Image prétraitée (binarisée, les pièces sont en blanc et le fond en
% noir) où l'on veut distinguer les pièces.
%
% origin : L'image couleur, celle qui correspond à mat.
%
% scale : scale factor correspondant à l'échelle de l'image en mm/pixels

rayonTh = [16.25, 18.75, 21.25, 19.75, 22.25, 24.25, 23.25, 25.75] / (2 * scale);
% Rayon théoriques
epsilon = 10;
% Erreur que l'on accepte

compte = 0;

[centers, radii] = imfindcircles(mat, [140, 240], 'ObjectPolarity', 'bright', 'Method', 'TwoStage', 'Sensitivity', 0.95);

figure;
imshow(mat);title ('Total');
viscircles(centers, radii);

datas = [centers, radii];
coins = couleur(origin, datas)

[m, ~] = size(coins);

for i = 1:m
    
    distance_couleur_cui = distance_3D (coins(i,4), coins(i,5), coins(i,6), 188.91, 131.17, 72.92);

    distance_couleur_gold = distance_3D (coins(i,4), coins(i,5), coins(i,6), 168.33, 129.33, 46.67);

    if((coins(i,3) >= rayonTh(1) - epsilon) && (coins(i,3) <= rayonTh(1)  + epsilon) && (distance_couleur_cui == min(distance_couleur_cui, distance_couleur_gold)))
        
        compte = compte + 0.01;
        
        figure;
        imshow(mat);title ('1 centime');
        centers = [coins(i,1), coins(i,2)];
        viscircles(centers, coins(i,3));

    elseif ((coins(i,3) >= rayonTh(2) - epsilon) && (coins(i,3) <= rayonTh(2) + epsilon) && (distance_couleur_cui == min(distance_couleur_cui, distance_couleur_gold)))
       
        compte = compte + 0.02;
        
        figure;
        imshow(mat);title ('2 centimes');
        centers = [coins(i,1), coins(i,2)];
        viscircles(centers, coins(i,3));

    elseif ((coins(i,3) >= rayonTh(3) - epsilon) && (coins(i,3) <= rayonTh(3) + epsilon) && (distance_couleur_cui == min(distance_couleur_cui, distance_couleur_gold)))
        
        compte  = compte + 0.05;
        
        figure;
        imshow(mat);title ('5 centimes');
        centers = [coins(i,1), coins(i,2)];
        viscircles(centers, coins(i,3));

    elseif ((coins(i,3) >= rayonTh(4) - epsilon) && (coins(i,3) <= rayonTh(4) + epsilon) && (distance_couleur_gold == min(distance_couleur_cui, distance_couleur_gold)))   
        
        compte = compte + 0.10;
        
        figure;
        imshow(mat);title ('10 centimes');
        centers = [coins(i,1), coins(i,2)];
        viscircles(centers, coins(i,3));

    elseif ((coins(i,3) >= rayonTh(5) - epsilon) && (coins(i,3) <= rayonTh(5) + epsilon) && (distance_couleur_gold == min(distance_couleur_cui, distance_couleur_gold)))  
        
        compte = compte + 0.20;
        
        figure;
        imshow(mat);title ('20 centimes');
        centers = [coins(i,1), coins(i,2)];
        viscircles(centers, coins(i,3));

    elseif ((coins(i,3) >= rayonTh(6) - epsilon) && (coins(i,3) <= rayonTh(6) + epsilon) && (distance_couleur_gold == min(distance_couleur_cui, distance_couleur_gold)))  
        
        compte = compte + 0.50;
        
        figure;
        imshow(mat);title ('50 centimes');
        centers = [coins(i,1), coins(i,2)];
        viscircles(centers, coins(i,3));

    elseif ((coins(i,3) >= rayonTh(7) - epsilon) && (coins(i,3) <= rayonTh(7) + epsilon))
       
        compte = compte + 1;
        
        figure;
        imshow(mat);title ('1 euro');
        centers = [coins(i,1), coins(i,2)];
        viscircles(centers, coins(i,3));

    elseif ((coins(i,3) >= rayonTh(8) - epsilon) && (coins(i,3) <= rayonTh(8) + epsilon))
        
        compte = compte + 2;
        
        figure;
        imshow(mat);title ('2 euros');
        centers = [coins(i,1), coins(i,2)];
        viscircles(centers, coins(i,3));

    else
        
        compte = compte + 0;
        
        figure;
        imshow(mat);title ('Sans famille');
        centers = [coins(i,1), coins(i,2)];
        viscircles(centers, coins(i,3));
    
    end
end

end