function id = identification(I)

coordCer1 = imfindcircles(I,290/2,'ObjectPolarity', 'bright', 'Method', 'TwoStage', 'Sensitivity', 0.95);

coordCer2 = imfindcircles(I,338/2,'ObjectPolarity', 'bright', 'Method', 'TwoStage', 'Sensitivity', 0.95);

coordCer5 = imfindcircles(I,393/2,'ObjectPolarity', 'bright', 'Method', 'TwoStage', 'Sensitivity', 0.95);

coordCer10 = imfindcircles(I,353/2,'ObjectPolarity', 'bright', 'Method', 'TwoStage', 'Sensitivity', 0.95);

coordCer20 = imfindcircles(I,398/2,'ObjectPolarity', 'bright', 'Method', 'TwoStage', 'Sensitivity', 0.95);

coordCer50 = imfindcircles(I,448/2,'ObjectPolarity', 'bright', 'Method', 'TwoStage', 'Sensitivity', 0.95);

coordCer1e = imfindcircles(I,417/2,'ObjectPolarity', 'bright', 'Method', 'TwoStage', 'Sensitivity', 0.95);

coordCer2e = imfindcircles(I,464/2,'ObjectPolarity', 'bright', 'Method', 'TwoStage', 'Sensitivity', 0.95);

viscircle(centers);

end
