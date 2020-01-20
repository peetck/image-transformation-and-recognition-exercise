clear all, close all, clc

img = imread('../../images/lenna.png');
img = mat2gray(rgb2gray(img));

subplot(1, 3, 1), imshow(img);
title('Original Image');

kernal = ones(11, 11) * ( 1 / 121 );

blur = imfilter(img, kernal, 'conv', 'replicate', 'same');

subplot(1, 3, 2), imshow(blur);
title('Average Filter 11 x 11');

diff = img - blur;

subplot(1, 3, 3), imshow(diff);
title('Diff btw original and blur');