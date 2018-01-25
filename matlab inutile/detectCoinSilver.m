function If = detectCoinSilver(I)

% I is a colored image with values between 0 an 1

If = rgb2hsv(testScalaireFond(I));
If = If(:, :, 1);

level = multithresh(If(:, :, 1), 3);
If = imbinarize(If, level(2)) - imbinarize(If, level(3));

end