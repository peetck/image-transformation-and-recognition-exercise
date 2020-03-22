close all,clear all,clc

I = imread('../../images/moon.tif');
I = imresize(I, 0.25);
I2 = imread('../../images/Fig0316(a)(moon).tif');
I2 = imresize(I2, 0.5);

BIMF(I);
BIMF(I2);

function BIMF(I)
    %I = I(1:36,1:36);
    if size(I,3) == 1
        Ig = double(I);
    else
        %Ig = double(rgb2gray(I));
        YCbCr = rgb2ycbcr(I);
        Ig = double(YCbCr(:,:,1));
    end


    imf = FABEMD(Ig,0.5,5,1);
    %prtIMF(imf,1)

    figure, subplot(1, 3, 1), imshow(Ig, [])
    title('Original')

    Ynew = sum(imf(:,:,end-1:end),3);

    subplot(1, 3, 2), imshow(Ynew, []);
    title('Last BIMF')

    subplot(1, 3, 3), imshow(Ig - Ynew, []);
    title('Result')
end