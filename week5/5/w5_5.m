clear all, close all, clc

% 5
% Start of PCA code,
Data_grayD = im2double(rgb2gray(imread('../../images/b.jpg')));
figure, imshow(Data_grayD);
[a b] = size(Data_grayD);
Data_mean = mean(Data_grayD);
Data_meanNew = repmat(Data_mean,a,1);
DataAdjust = Data_grayD - Data_meanNew;
cov_data = cov(DataAdjust);
[V, D] = eig(cov_data);
V_trans = transpose(V);
DataAdjust_trans = transpose(DataAdjust);
FinalData = V_trans * DataAdjust_trans;
% Image compression
PCs = 5;
Reduced_V = V(:,end-PCs:end);
Y = Reduced_V'* DataAdjust_trans;
Compressed_Data=Reduced_V*Y;
Compressed_Data = Compressed_Data' + Data_meanNew;
figure, imshow(Compressed_Data);
figure, imshow(Data_grayD - Compressed_Data, []);