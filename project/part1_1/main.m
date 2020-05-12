clear all, close all, clc

% load data
a = load('scatterData.mat');

% convert data to matlab matrix
a = cell2mat(struct2cell(a));
x = a(:, 1);
y = a(:, 2);
z = a(:, 3);

% find data zero mean
data(:,1) = x - mean(x);
data(:,2) = y - mean(y);
data(:,3) = z - mean(z);

% find covariance matrix
C = cov(data);

% find eigenvalue / vector
[V,D] = eig(C);

% display (plot)
figure, scatter3(x, y, z, 'b');

% ????? eigenvector ???????? ??? ??????
line([0 V(1,1)],[0 V(2,1)], [0 V(3, 1)], 'Color','blue', 'LineWidth',0.75);
line([0 V(1,2)],[0 V(2,2)], [0 V(3, 2)],'Color','red', 'LineWidth',0.75);
line([0 V(1,3)],[0 V(2,3)], [0 V(3, 3)],'Color','green', 'LineWidth',0.75);

xlabel('X'); % ??????????? 'X' ?? ????
ylabel('Y'); % ??????????? 'Y' ?? ????
zlabel('Z'); % ??????????? 'Z' ?? ????

