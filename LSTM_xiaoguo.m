clc
clear all
% load train_data.mat
% load test_data.mat
load train_data1.mat
load test_data1.mat

train_data = train_data1;
test_data = test_data1;
%% Train net
Y=[];

for ii=1:size(train_data,1)
    Y = [Y,train_data{ii,2}];
end

index0 = find(Y==0);
index1 = find(Y==1);
Y=categorical(Y)';

% sample1 = index1(randi(length(index1),2000,1));
% sample0 = index0(randi(length(index0),2000,1));
k0=crossvalind('Kfold',index0',10);
k1=crossvalind('Kfold',index1',10);

history=[];
for ii =1:10
train_k0=find((k0~=ii));
train_k1=find((k1~=ii));
sample1=index1(train_k1);
sample0=index0(train_k0);

sample =[sample1,sample0,sample1,sample1];
sample= sample(randperm(length(sample)));
XTrain = train_data(sample,1);
YTrain = Y(sample,1);
[net] = LSTMM(30,XTrain,YTrain,20);

test_k0=find((k0==ii));
test_k1=find((k1==ii));
sample1=index1(test_k1);
sample0=index0(test_k0);

test_index =[sample1,sample0];
%test_index = randi(length(Y),1000,1);

YPred = classify(net,train_data(test_index,1));
[RMSE,TP,FP,TN,FN,recall,precison,Acc,F1] = show_result(YPred,Y(test_index));
tt = [RMSE,TP,FP,TN,FN,recall,precison,Acc,F1];

history=[history;tt];
ii
end

%% app net
list_length = 60;
goal =  classify(net,test_data(1:list_length,1)) ;
goal = find(string(goal) == '1');
location = test_data(goal,4)

list_length = 60;
goal =  classify(net,train_data(1:list_length,1)) ;
goal = find(string(goal) == '1');
location = train_data(goal,6)








