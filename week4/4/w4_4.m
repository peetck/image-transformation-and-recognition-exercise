clear all, close all, clc

circle = imread('../../images/pic1.bmp');
triangle = imread('../../images/pic2.bmp');
square = imread('../../images/pic3.bmp');
rectangle = imread('../../images/pic4.bmp');

F_circle = fftshift(fft2(circle));
F_triangle = fftshift(fft2(triangle));
F_square = fftshift(fft2(square));
F_rectangle = fftshift(fft2(rectangle));

figure, subplot(2, 4, 1), imshow(circle, []);
subplot(2, 4, 2), imshow(triangle, []);
subplot(2, 4, 3), imshow(square, []);
subplot(2, 4, 4), imshow(rectangle, []);

subplot(2, 4, 5), imshow(log(1 + abs(F_circle)), []);
subplot(2, 4, 6), imshow(log(1 + abs(F_triangle)), []);
subplot(2, 4, 7), imshow(log(1 + abs(F_square)), []);
subplot(2, 4, 8), imshow(log(1 + abs(F_rectangle)), []);
