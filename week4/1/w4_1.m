clear all, close all, clc

% 1.1 ========================
lenna_img = imread('../../images/lenna.png');
 
lenna_gray = rgb2gray(lenna_img);
 
F = fftshift(fft2(lenna_gray));

F(1 : 99,1 : end) = 0
F(121 : end, :) = 0
F(1 : end, 1: 100) = 0;
F(1 : end, 121: end) = 0;
 
Fshow = log(1 + abs(F));
 
figure, subplot(2, 2, 1), imshow(Fshow, []);
 
I = ifft2(fftshift(F));
 
subplot(2, 2, 3), imshow(I, []);
 
% 1.2 ===============================================
 
F = fftshift(fft2(lenna_gray));
 
F(1: 99, :) = 0;
F(100: 120, 100: 120) = 0;
F(121: end, :) = 0;
 
Fshow = log(1 + abs(F));
 
subplot(2, 2, 2), imshow(Fshow, []);
 
I = ifft2(fftshift(F));
 
subplot(2, 2, 4), imshow(I, []);