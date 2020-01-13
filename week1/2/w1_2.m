clear all, close all, clc

img = imread('../../images/lenna.png'); % 220 x 220

gray = rgb2gray(img);

subplot(1, 3, 1), imshow(img);
title('Original Image');
subplot(1, 3, 2), imshow(gray);
title('Grayscale');

answer = ones(292, 292);
answer(1:36, :) = 0;
answer(:, 1:36) = 0;
answer(257:end, :) = 0;
answer(:, 257:end) = 0;
answer(37: 256, 37: 256) = gray;
answer = uint8(answer);
subplot(1, 3, 3), imshow(answer);
title('Answer');