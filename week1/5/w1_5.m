clear all, close all, clc

v1 = [0.2, 0.1, 0.3, 0.3, 0.3];

v2 = [0.7, 0.7, 0.7, 0.8, 0.8];

v3 = [0.8, 0.8, 0.7, 0.7, 0.6];

figure, plot(v1);
title('v1');

figure, plot(v2);
title('v2');

figure, plot(v3);
title('v3');

figure, hold on, plot(v1), plot(v2), plot(v3);
title('In same Figure');

