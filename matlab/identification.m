function id = identification(I)

[coordCer1, rad1] = imfindcircles(I,round([285/2,296/2]),'ObjectPolarity', 'bright', 'Method', 'TwoStage', 'Sensitivity', 0.97);

figure;
imshow(I,[]),title('1 centime');
viscircles(coordCer1, rad1);

[coordCer2,rad2] = imfindcircles(I,round([337/2,339/2]),'ObjectPolarity', 'bright', 'Method', 'TwoStage', 'Sensitivity', 0.99);

figure;
imshow(I,[]),title('2 centimes');
viscircles(coordCer2, rad2);

[coordCer5, rad5] = imfindcircles(I,round([392/2, 394/2]),'ObjectPolarity', 'bright', 'Method', 'TwoStage', 'Sensitivity', 0.98);

figure;
imshow(I,[]),title('5 centimes');
viscircles(coordCer5, rad5);

[coordCer10, rad10] = imfindcircles(I,round([352/2,355/2]),'ObjectPolarity', 'bright', 'Method', 'TwoStage', 'Sensitivity', 0.98);

figure;
imshow(I,[]),title('10 centimes');
viscircles(coordCer10, rad10);

[coordCer20, rad20] = imfindcircles(I,round([398/2,415/2]),'ObjectPolarity', 'bright', 'Method', 'TwoStage', 'Sensitivity', 0.98);

figure;
imshow(I,[]),title('20 centimes');
viscircles(coordCer20, rad20);

[coordCer50, rad50] = imfindcircles(I,round([446/2,449/2]),'ObjectPolarity', 'bright', 'Method', 'TwoStage', 'Sensitivity', 0.98);

figure;
imshow(I,[]),title('50 centimes');
viscircles(coordCer50, rad50);

[coordCer1e, rad1e] = imfindcircles(I,round([416/2,418/2]),'ObjectPolarity', 'bright', 'Method', 'TwoStage', 'Sensitivity', 0.99);

figure;
imshow(I,[]),title('1 euro');
viscircles(coordCer1e, rad1e);

[coordCer2e, rad2e] = imfindcircles(I,round([460/2,465/2]),'ObjectPolarity', 'bright', 'Method', 'TwoStage', 'Sensitivity', 0.98);

figure;
imshow(I,[]),title('2 euros');
viscircles(coordCer2e, rad2e);

end
