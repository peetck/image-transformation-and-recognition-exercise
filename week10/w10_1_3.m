clear all, close all, clc

trainData = [];
trainLabel = [];
for i = 1:1:2
    for j = 1:1:94
        [h w] = size(imread(['characters/' num2str(i) '/text (' num2str(j) ').bmp']));
        trainData = [trainData; h w];
        trainLabel = [trainLabel; num2str(i)];
    end
end

% test ???????? 2
img = imread('characters/2/text (1).bmp');
[h w] = size(img);
testData = [h w];


% class ?????? (knn)
testLabel = knnclassify(testData, trainData, trainLabel, 1, 'sqEuclidean')

% class ?????? (svm)
SVMModel = fitcsvm(trainData, trainLabel, 'KernelFunction','rbf');
label = predict(SVMModel, testData)
