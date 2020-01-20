close all, clear all, clc

img = imread('../../images/lenna.png');
img = mat2gray(rgb2gray(img));

count = 1;

for i = 3:2:11
    filter = ones(i, i) * ( 1 / (i * i) );
    result = imfilter(img, filter, 'conv', 'replicate', 'same');
    subplot(1, 5, count), imshow(result);
    title(sprintf('%d x %d', i, i));
    count = count + 1;
end
