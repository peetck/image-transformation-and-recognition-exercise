clear all;
close all;
clc;

img = imread('../../images/lenna.png'); % 220 x 220

gray = rgb2gray(img);

subplot(1, 3, 1), imshow(img);
title('Original Image');
subplot(1, 3, 2), imshow(gray);
title('Grayscale');

answer = gray;
answer(110: 126, 100: 172) = 0;
subplot(1, 3, 3), imshow(answer);
title('Answer');