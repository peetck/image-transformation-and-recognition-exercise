close all,clear all,clc

%I = imread('high_008.jpg');
I = imread('../../images/test.jpg');
I = imresize(I,[256 256]);
I = I(1:36,1:36);
if size(I,3) == 1
    Ig = double(I);
else
    Ig = double(rgb2gray(I));
    YCbCr = rgb2ycbcr(I);
    Ig = double(YCbCr(:,:,1));
end


imf = FABEMD(Ig,0.5,15,1);
prtIMF(imf,1)

Ynew = sum(imf(:,:,1:end-1),3);
YCbCr(:,:,1) = Ynew;
Iout = ycbcr2rgb(YCbCr);
figure,imshow([I Iout]);


