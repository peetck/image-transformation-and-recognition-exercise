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

% load data (with augmentation (flip))
imdsTr_new = imageDatastore(['../Tr'],'IncludeSubfolders',true, 'FileExtensions','.bmp','LabelSource','foldernames');
imdsTr_new.ReadFcn = @flipdimReadDatastoreImage;

% merge
imdsTr_cat = imageDatastore(cat(1, imdsTr.Files, imdsTr_new.Files));
imdsTr_cat.ReadFcn = @normalReadDatastoreImage;
imdsTr_cat.Labels = cat(1, imdsTr.Labels, imdsTr_new.Labels);
imdsTr = imdsTr_cat;

% load data (with augmentation (rotate))
imdsTr_new = imageDatastore(['../Tr'],'IncludeSubfolders',true, 'FileExtensions','.bmp','LabelSource','foldernames');
imdsTr_new.ReadFcn = @imrotateReadDatastoreImage;

% merge
imdsTr_cat = imageDatastore(cat(1, imdsTr.Files, imdsTr_new.Files));
imdsTr_cat.ReadFcn = @normalReadDatastoreImage;
imdsTr_cat.Labels = cat(1, imdsTr.Labels, imdsTr_new.Labels);
imdsTr = imdsTr_cat;

options =  trainingOptions('sgdm', 'MiniBatchSize',10, 'MaxEpochs',6, 'InitialLearnRate',1e-4, 'Shuffle','every-epoch', 'ValidationData',imdsTr, 'ValidationFrequency',3, 'Verbose',false, 'Plots','training-progress');

netTransfer = trainNetwork(imdsTr,layers,options);
save('../augmentation_1_2.mat','netTransfer')

