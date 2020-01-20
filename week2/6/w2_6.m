clear all, close all, clc

img = imread('../../images/lenna.png');
img = rgb2gray(img);
img = mat2gray(img);

kernal = [0 1 1;
         -1 0 1;
         -1 -1 0];
     
img = imfilter(img, kernal);

imshow(img)