clear all, close all, clc

% right top 
 
lenna_img = imread('../../images/lenna.png');
 
lenna_gray = rgb2gray(lenna_img);
 
F = fftshift(fft2(lenna_gray));
 
F(1 : end, 1: 110) = 0
F(110 : end, :) = 0
 
Fshow = log(1 + abs(F));
 
figure, imshow(Fshow, []);
 
I = ifft2(fftshift(F));
 
figure, imshow(I, []);
 
% left bottom

F = fftshift(fft2(lenna_gray));
 
F(1 : 110,:) = 0
F(110 : end, 111: end) = 0
 
Fshow = log(1 + abs(F));
 
figure, imshow(Fshow, []);
 
I = ifft2(fftshift(F));
 
figure, imshow(I, []);
