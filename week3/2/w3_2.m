clear all, clc, close all

img = imread('../../images/myPic.png'); % 220 x 220

global_mean = mean(img(:));

global_mean = ones(220, 220) * global_mean;

kernal = ones(5, 5) * (1 / 25);

local_mean = imfilter(img, kernal, 'conv', 0, 'same')

figure, mesh(global_mean, 'FaceAlpha','0.5','EdgeColor','red','FaceColor' ,'red'), title('Global Mean')
figure, mesh(local_mean, 'FaceAlpha','0.5','EdgeColor','blue','FaceColor' ,'blue'), title('Local Mean')
