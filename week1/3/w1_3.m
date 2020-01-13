clear all, close all, clc

img = imread('../../images/lenna.png'); % 220 x 220

subplot(1, 2, 1), imshow(img);
title('Original Image');

gray = rgb2gray(img);

subplot(1, 2, 2), imshow(gray);
title('Grayscale');

answer = gray(1:2:220, 1:2:220);

figure, imshow(answer);
title('answer');

% or use imresize()

answer = imresize(gray, 0.5);

figure, imshow(answer);
title('answer (imresize)');