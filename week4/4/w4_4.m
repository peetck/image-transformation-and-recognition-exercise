clear all, close all, clc

lenna_img = imread('../../images/lenna.png');

lenna_gray = rgb2gray(lenna_img);

F = fftshift(fft2(lenna_gray));

circle_mask = genMaskC(220, 220, 0, 50);

triangle_mask = zeros(220, 220);
row = 160;
col_l = 60;
col_r = 160;
while 1
    triangle_mask(row, col_l:col_r) = 1;
    row = row - 1;
    col_l = col_l + 0.5;
    col_r = col_r - 0.5;
    if col_l >= col_r
        break
    end
end

square_mask = zeros(220, 220);
square_mask(60:160, 60:160) = 1;

rectangle_mask = zeros(220, 220);
rectangle_mask(90:130, 30:190) = 1;

Fshow1 = ifft2(fftshift(F .* circle_mask));
Fshow2 = ifft2(fftshift(F .* triangle_mask));
Fshow3 = ifft2(fftshift(F .* square_mask));
Fshow4 = ifft2(fftshift(F .* rectangle_mask));

figure, subplot(2, 4, 1), imshow(circle_mask);
subplot(2, 4, 2), imshow(triangle_mask);
subplot(2, 4, 3), imshow(square_mask);
subplot(2, 4, 4), imshow(rectangle_mask);

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