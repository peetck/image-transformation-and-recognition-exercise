clear all, close all, clc

first = ([32 32]./[8 8] - [2 2]);
back = ([2 2] - [1 1]);
BlocksPerImage = floor(first./back + 1);



N = prod([BlocksPerImage, [2 2], 9])


