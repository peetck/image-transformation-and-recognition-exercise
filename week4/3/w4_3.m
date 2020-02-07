clear all, close all, clc

% not finish !! 

lenna_img = imread('../../images/lenna.png');
 
lenna_gray = rgb2gray(lenna_img);
 
F = fftshift(fft2(lenna_gray));
 
mask_1 = genMaskC(220, 220, 1, 15);
mask_2 = genMaskC(220, 220, 11, 25);
 
Fshow1 = ifft2(fftshift(F .* mask_1));
Fshow2 = ifft2(fftshift(F .* mask_2));
 
figure, subplot(2, 2, 1), imshow(mask_1);
subplot(2, 2, 2), imshow(mask_2);
 
subplot(2, 2, 3), imshow(Fshow1, []);
subplot(2, 2, 4), imshow(Fshow2, []);

function out = genMaskC(r, c, rMin, rMax)
    out = zeros(r,c);
    cr = ceil(r/2);
    cc = ceil(c/2);
    for i =1:1:r
        for j =1:1:c
            pr = i - cr;
            pc = j - cc;
            tmpr = sqrt(pr^2+pc^2);
            if tmpr >= rMin && tmpr <= rMax
                out(i,j) = 1;
            end
        end
    end
end