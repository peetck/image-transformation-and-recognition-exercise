close all,clear all,clc

I = imread('../../images/lenna.png');
%I = imread('../img/myPic.png');
%I = imresize(I,[256 256]);
% I = I(1:36,1:36);
if size(I,3) == 1
    Ig = double(I);
else
    %Ig = double(rgb2gray(I));
    YCbCr = rgb2ycbcr(I);
    Ig = double(YCbCr(:,:,1));
end


imf = FABEMD(Ig,0.5,15,1);
%prtIMF(imf,1)

Ynew = sum(imf(:,:,end-1:end),3);

figure, subplot(1, 2, 1), imshow(Ig, []);
subplot(1, 2, 2), imshow(Ynew, [])

