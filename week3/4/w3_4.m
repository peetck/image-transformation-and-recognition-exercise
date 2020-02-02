clear all, clc, close all

data = [
    1 1 1 2 2 3 3 4 5;
1 1 2 2 2 3 4 5 5;
2 2 2 3 3 4 4 6 6;
2 2 3 3 4 4 6 6 6;
3 3 1 1 12 7 7 7 7;
11 12 12 12 12 7 7 7 7;
9 9 9 10 10 8 8 8 8;
9 9 10 10 10 10 9 9 9
]

hist_data = hist(data(:),5);

figure, bar(hist_data)