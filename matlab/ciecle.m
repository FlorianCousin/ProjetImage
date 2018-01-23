function compte = ciecle(mat, origin)

% Cette fonction permet de distinguer les diff�rentes pi�ces d'une image en
% comparant sa taille et sa couleur par rapport aux moyennes th�oriques
% calcul�es auparavant. 

% compte : Nombre comptant le montant total des pi�ces d'une image (en
% euros)
%
% mat : Image pr�trait�e o� l'on veut distinguer les pi�ces.
%
% origin : Image couleur
%

compte = 0;

[centers, radii] = imfindcircles(mat, [140, 240], 'ObjectPolarity', 'bright', 'Method', 'TwoStage', 'Sensitivity', 0.95)

figure;
imshow(mat);title ('Total');
viscircles(centers, radii);

datas = [centers, radii];
peaces = couleur(origin, datas)

[m, ~] = size(peaces);

for i = 1:m
    
    distance_couleur_cui = distance_3D (peaces(i,4), peaces(i,5), peaces(i,6), 188.91, 131.17, 72.92);

    distance_couleur_gold = distance_3D (peaces(i,4), peaces(i,5), peaces(i,6), 168.33, 129.33, 46.67);

    if((peaces(i,3) >= 140) && (peaces(i,3) <= 151) && (distance_couleur_cui == min(distance_couleur_cui, distance_couleur_gold)))
        
        compte = compte + 0.01;
        
        figure;
        imshow(mat);title ('1 centime');
        centers = [peaces(i,1), peaces(i,2)];
        viscircles(centers, peaces(i,3));

    elseif ((peaces(i,3) >= 168) && (peaces(i,3) <= 171)) %&& (distance_couleur_cui == min(distance_couleur_cui, distance_couleur_gold)))
       
        compte = compte + 0.02;
        
        figure;
        imshow(mat);title ('2 centimes');
        centers = [peaces(i,1), peaces(i,2)];
        viscircles(centers, peaces(i,3));

    elseif ((peaces(i,3) >= 195) && (peaces(i,3) <= 197)) %%&& (distance_couleur_cui == min(distance_couleur_cui, distance_couleur_gold)))
        
        compte  = compte + 0.05;
        
        figure;
        imshow(mat);title ('5 centimes');
        centers = [peaces(i,1), peaces(i,2)];
        viscircles(centers, peaces(i,3));

    elseif ((peaces(i,3) >= 176) && (peaces(i,3) <= 181) && (distance_couleur_gold == min(distance_couleur_cui, distance_couleur_gold)))   
        
        compte = compte + 0.10;
        
        figure;
        imshow(mat);title ('10 centimes');
        centers = [peaces(i,1), peaces(i,2)];
        viscircles(centers, peaces(i,3));

    elseif ((peaces(i,3) >= 198) && (peaces(i,3) <= 207) && (distance_couleur_gold == min(distance_couleur_cui, distance_couleur_gold)))  
        
        compte = compte + 0.20;
        
        figure;
        imshow(mat);title ('20 centimes');
        centers = [peaces(i,1), peaces(i,2)];
        viscircles(centers, peaces(i,3));

    elseif ((peaces(i,3) >= 223) && (peaces(i,3) <= 225) && (distance_couleur_gold == min(distance_couleur_cui, distance_couleur_gold)))  
        
        compte = compte + 0.50;
        
        figure;
        imshow(mat);title ('50 centimes');
        centers = [peaces(i,1), peaces(i,2)];
        viscircles(centers, peaces(i,3));

    elseif ((peaces(i,3) >= 208) && (peaces(i,3) <= 214))
       
        compte = compte + 1;
        
        figure;
        imshow(mat);title ('1 euro');
        centers = [peaces(i,1), peaces(i,2)];
        viscircles(centers, peaces(i,3));

    elseif ((peaces(i,3) >= 230) && (peaces(i,3) <= 240))
        
        compte = compte + 2;
        
        figure;
        imshow(mat);title ('2 euros');
        centers = [peaces(i,1), peaces(i,2)];
        viscircles(centers, peaces(i,3));

    else
        
        compte = compte + 0;
        
        figure;
        imshow(mat);title ('Sans famille');
        centers = [peaces(i,1), peaces(i,2)];
        viscircles(centers, peaces(i,3));
    
    end
end
end