clear all, close all, clc

lenna_img = imread('../../images/lenna.png');
 
lenna_gray = rgb2gray(lenna_img);
 
F = fftshift(fft2(lenna_gray));
 
mask_1 = genMaskC(220, 220, 1, 20);
mask_2 = genMaskC(220, 220, 20, 40);
mask_3 = genMaskC(220, 220, 40, 60);
mask_4 = genMaskC(220, 220, 60, 80);
 
Fshow1 = ifft2(fftshift(F .* mask_1));
Fshow2 = ifft2(fftshift(F .* mask_2));
Fshow3 = ifft2(fftshift(F .* mask_3));
Fshow4 = ifft2(fftshift(F .* mask_4));
 
figure, subplot(2, 4, 1), imshow(log(1 + abs(F .* mask_1)), []);
subplot(2, 4, 2), imshow(log(1 + abs(F .* mask_2)), []);
subplot(2, 4, 3), imshow(log(1 + abs(F .* mask_3)), []);
subplot(2, 4, 4), imshow(log(1 + abs(F .* mask_4)), []);
 
subplot(2, 4, 5), imshow(Fshow1, []);
subplot(2, 4, 6), imshow(Fshow2, []);
subplot(2, 4, 7), imshow(Fshow3, []);
subplot(2, 4, 8), imshow(Fshow4, []);

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