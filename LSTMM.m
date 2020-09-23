function [net] = LSTMM(k,XTrain,YTrain,inputSize)

inputSize = inputSize;
numHiddenUnits = k;
numClasses = length(unique(YTrain));


YTrain=categorical(YTrain);


layers = [ ...
    sequenceInputLayer(inputSize)
    lstmLayer(numHiddenUnits,'OutputMode','last')
    %dropoutLayer(0.1)
    fullyConnectedLayer(2)
    softmaxLayer
    classificationLayer];

maxEpochs = 70;
miniBatchSize = 256;
 
options = trainingOptions('adam', ...
    'ExecutionEnvironment','gpu', ...
    'MaxEpochs',maxEpochs, ...
    'MiniBatchSize',miniBatchSize, ...
    'InitialLearnRate',0.1, ...
    'LearnRateSchedule','piecewise', ...
    'LearnRateDropPeriod',20,... 
    'SequenceLength','longest', ...
    'Shuffle','never', ...
    'Verbose',0);


net = trainNetwork(XTrain,YTrain,layers,options);

%{
YPred = classify(net,XTest, ...
    'SequenceLength','longest','MiniBatchSize',miniBatchSize);

%}

end

