clear all, close all, clc

% 4

score = [
2 7 8;
6 2 2;
6 5 8;
1 6 2;
1 8 9;
4 9 3;
9 5 1;
3 1 2;
5 1 6;
2 2 4];

score_mean = mean(score, 2);
zero_mean = score - score_mean;

c = cov(zero_mean')

[V, D] = eig(c)