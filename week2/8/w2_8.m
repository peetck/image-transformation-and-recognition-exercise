close all, clear all, clc

img = imread('../../images/lenna.png');
img = mat2gray(rgb2gray(img));

count = 1;

for i = 3:2:11
    gaussian_filter = fspecial('gaussian', i, i);
    gau = imfilter(img, gaussian_filter, 'conv', 'replicate', 'same');
    subplot(1, 5, count), imshow(gau);
    title(sprintf('%d x %d', i, i));
    count = count + 1;
end
