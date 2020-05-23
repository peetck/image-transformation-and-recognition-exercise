clear all, close all, clc

% load training set

load no_augmentation.mat
%load augmentation_1.mat
%load augmentation_2.mat
%load augmentation_3.mat
%load augmentation_1_2.mat
%load augmentation_1_3.mat
%load augmentation_2_3.mat
%load augmentation_1_2_3.mat

% load test 
imdsTs = imageDatastore(['Tr'],'IncludeSubfolders',true, 'FileExtensions','.bmp','LabelSource','foldernames');
imdsTs.ReadFcn = @customReadDatastoreImage;

% ทําการ predict
YPred = predict(netTransfer,imdsTs);
[GN, ~, idx] = unique(imdsTs.Labels);

score = 0;

% loop เช็กว่า predict ได้ถูกกี่รูปภาพ
for i = 1:numel(idx)
    id = find(max( YPred(i,:)) == YPred(i,:));
    score = score + (id == (idx(i)));
end

% คิดออกมาเป็น %
percent = score/numel(idx) * 100

% function ที่เอาไว้อ่านรูปภาพ
function data = customReadDatastoreImage(filename)
    % code from default function: 
    onState = warning('off', 'backtrace'); 
    c = onCleanup(@() warning(onState)); 
    data = imread(filename); % added lines: 
    data = data(:,:,min(1:3, end)); 
    data = imresize(data,[227 227]);
end