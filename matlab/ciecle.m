function matrix = ciecle(mat)

[centers, radii] = imfindcircles(mat, [140, 240], 'ObjectPolarity', 'bright', 'Method', 'TwoStage', 'Sensitivity', 0.95);

peaces = couleur(mat, [centers, radii]);

distance_couleur = distance_3D (peaces(4), peaces(5), peaces(6), 188.91, 131.17, 72.92);

if((radii >= 285/2) && (radii <= 296/2) && (peaces(4) == 


end