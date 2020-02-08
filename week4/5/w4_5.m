clear all, close all, clc

inImage = imread('../../images/lenna.png');
inImg = im2double(rgb2gray(inImage));
[rows cols]=size(inImg);
inImg = imresize(inImg, [64, 64]);

% The actual Spectral Residual computation: just 5 Matlab lines!
myFFT = fft2(inImg);
myLogAmplitude = log(abs(myFFT));
myPhase = angle(myFFT);
mySpectralResidual = myLogAmplitude - imfilter(myLogAmplitude, fspecial('average', 3), 'replicate');
saliencyMap = abs(ifft2(exp(mySpectralResidual + 1i*myPhase))).^2;

% After Effect
saliencyMap = imfilter(saliencyMap, fspecial('disk', 3));
% Resizing from 64*64 to the original size
saliencyMap = mat2gray(saliencyMap);
saliencyMap = imresize(saliencyMap, [rows cols]);
salMap=im2double(saliencyMap);
% Display
figure,imshow(inImage)
figure,imshow(salMap)