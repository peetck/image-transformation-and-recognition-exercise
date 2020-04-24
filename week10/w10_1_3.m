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

img = imread('characters/1/text (1).bmp');
[h w] = size(img);
testData = [h w];

% knn
testLabel = knnclassify(testData, trainData, trainLabel, 1, 'sqEuclidean')

% svm
SVMModel = fitcsvm(trainData, trainLabel);
label = predict(SVMModel, testData)
