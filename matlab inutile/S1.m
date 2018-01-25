clear all; close all;


f = imread('ProjetImage/images/C1_C10_C20_E1_E2.jpg');
figure;imtool(f);
% figure;imshow(f(800:2400,600:2400,:));

%--Scaling Factor
% 5 cent  : 21.25 / 618.84 = 0.0343
% 1 euro  : 23.25 / 679 =  0.0342
% 2 euros : 25.75 / 753.5 = 0.0342
% SF =  0.0342;

CopperReg = f(180:180+150, 210:210+150,:);
figure;imtool(CopperReg);
CopR = round(mean2(CopperReg(:,:,1)));
CopG = round(mean2(CopperReg(:,:,2)));
CopB = round(mean2(CopperReg(:,:,3)));

[402 176 46 30]
SilverReg = f(176:176 + 30,440:440 + 46,:);
figure;imtool(SilverReg);
SilR = round(mean2(SilverReg(:,:,1)));
SilG = round(mean2(SilverReg(:,:,2)));
SilB = round(mean2(SilverReg(:,:,3)));

WhiteReg = f(1:50,1:50,:);
figure;imtool(WhiteReg);
WhiR = round(mean2(WhiteReg(:,:,1)));
WhiG = round(mean2(WhiteReg(:,:,2)));
WhiB = round(mean2(WhiteReg(:,:,3)));
 
% GoldReg = f(1800:2000,1250:1700,:);
% figure;imtool(GoldReg);
% GolR = mean2(GoldReg(:,:,1));
% GolG = mean2(GoldReg(:,:,2));
% GolB = mean2(GoldReg(:,:,3));

[CopR CopG CopB ; SilR SilG SilB ; WhiR WhiG WhiB]
