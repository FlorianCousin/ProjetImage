clear;
close all;
clc;

sigma = [0, 0.0001, 0.0002, 0.0003, 0.0004, 0.0005, 0.0006, 0.0007, 0.0008, 0.0009, 0.001, 0.0015, 0.002, 0.0025, 0.003, 0.0035];
precision = [40.1, 38.71, 30.65, 25.81, 24.19, 27.42, 25.81, 16.13, 19.35, 16.13, 11.29, 8.06, 8.06, 4.84, 3.23, 0] / 100;

plot(sigma, precision); title('précision en fonction de l''écart-type du bruit blanc gaussien');
xlabel('écart-type'); ylabel('précision');
