clear all, close all, clc

img = imread('../../images/moon.tif')
img = mat2gray(img);

g = mat2gray(2 * (img .^ 0.4));

figure, imshow(log(1 + abs(g)), []);

img = imread('../../images/Fig0316(a)(moon).tif')
img = mat2gray(img);

g = mat2gray(2 * (img .^ 0.4));

figure, imshow(log(1 + abs(g)), []);
