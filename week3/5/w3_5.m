clear all, clc, close all

img = imread('../../images/lenna.png');

img_hsv = rgb2hsv(img)

h = img_hsv(:, :, 1)
s = img_hsv(:, :, 2)
v = img_hsv(:, :, 3)

hist_h = hist(h(:), 128);
hist_s = hist(s(:), 128);
hist_v = hist(v(:), 128);

figure, bar(hist_h), title('H')
figure, bar(hist_s), title('S')
figure, bar(hist_v), title('V')