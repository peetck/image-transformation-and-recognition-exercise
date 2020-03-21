clear all, close all, clc;

% ???????????????? (Decomposition)
f = (rgb2gray(imread('../../../images/lenna.png')));
figure, subplot(2, 2, 1), imshow(f, [])
[cA,cH,cV,cD] = dwt2(f,'haar');
[cA2,cH2,cV2,cD2] = dwt2(cA, 'haar');

% Reconstruction
blur = idwt2(cA2, [], [], [], 'haar')
blur = idwt2(blur, [], [], [], 'haar')
subplot(2, 2, 2), imshow(blur,[])

edge = idwt2([], cH, cV, cD, 'haar')
subplot(2, 2, 4), imshow(edge,[])