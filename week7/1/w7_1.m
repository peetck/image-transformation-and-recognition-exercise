clear all, close all, clc

a = [2;6;6;1;1;4;9;3;5;2];
b = [7;2;5;6;8;9;5;1;1;2];
answer = []

for i = 1:10
    x1 = a(i)
    x2 = b(i)
    
    n1 = x1 ^ 2
    n2 = sqrt(2)*x1*x2
    n3 = x2 ^ 2
    
    answer = [answer; n1 n2 n3] 
end

scatter3(answer(1:10, 1), answer(1:10, 2), answer(1:10, 3))
         