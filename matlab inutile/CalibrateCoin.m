function calibration = CalibrateCoin(coin)

calibration = zeros(1);

for i = 1
    I = double(imread('../images/' + coin + '_' + int2str(i) + '.jpg')) / 255;
    calibration(i) = '../images/' + coin + '_' + int2str(i) + '.jpg';
    figure(); imshow(I);
end

end