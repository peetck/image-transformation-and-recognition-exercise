clear all, close all, clc

I = imread('../../../images/lenna.png');
J = rgb2gray(imnoise(I,'salt & pepper',0.02));

figure, subplot(1, 2, 1), imshow(J, []);

[cA1,cH1,cV1,cD1] = dwt2(J,'haar');
[cA2,cH2,cV2,cD2] = dwt2(cA1,'haar');

new = idwt2(cA2, cH2,cV2,cD2,'haar');
new = idwt2(new, [],[],[] ,'haar');

subplot(1, 2, 2), imshow(new, []);