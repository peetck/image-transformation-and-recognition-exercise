clear all, close all, clc

% load alexnet
net = alexnet;
inputSize = net.Layers(1).InputSize;

layersTransfer = net.Layers(1:end-3);
numClasses = 6;
layers = [
    layersTransfer;
    fullyConnectedLayer(numClasses,'WeightLearnRateFactor',20,'BiasLearnRateFactor',20);
    softmaxLayer;
    classificationLayer
];

% load data 
imdsTr = imageDatastore(['../Tr'],'IncludeSubfolders',true, 'FileExtensions','.bmp','LabelSource','foldernames');
imdsTr.ReadFcn = @normalReadDatastoreImage;

options =  trainingOptions('sgdm', 'MiniBatchSize',10, 'MaxEpochs',6, 'InitialLearnRate',1e-4, 'Shuffle','every-epoch', 'ValidationData',imdsTr, 'ValidationFrequency',3, 'Verbose',false, 'Plots','training-progress');

netTransfer = trainNetwork(imdsTr,layers,options);
save('../no_augmentation.mat','netTransfer')
