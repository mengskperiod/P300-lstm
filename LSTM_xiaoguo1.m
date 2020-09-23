clc
clear all
%load train_data.mat
%load test_data.mat
load train_data1.mat
load test_data1.mat

train_data = train_data1;
test_data = test_data1;

time=0;
gongxi=0;
last_list = ['1';'2';'3';'4';'5';'6';'7';'8';'9';'0'];
goal_list = ['m';'f';'5';'2';'i';'*';'*';'*';'*';'*'];
history_tt=[];

    




ii = size(train_data,1);
while  ii >=0
    if ii ==0
        ii = ii-1;
        continue
    end
    if train_data{ii,5}==5
       train_data(ii,:)=[];
    end
   ii = ii-1;
end





%% Train net
Y=[];

for ii=1:size(train_data,1)
    Y = [Y,train_data{ii,2}];
end

index0 = find(Y==0);
index1 = find(Y==1);
Y=categorical(Y)';

sample1 = index1(randi(length(index1),300,1));
sample0 = index0(randi(length(index0),500,1));

sample =[sample1,sample0];
sample=sample(randperm(length(sample)));
XTrain = train_data(sample,1);
YTrain = Y(sample,1);
[net] = LSTMM(100,XTrain,YTrain,20);

test_index = randi(length(Y),500,1);
YPred = classify(net,train_data(test_index,1));
[RMSE,TP,FP,TN,FN,recall,precison,Acc,F1] = show_result(YPred,Y(test_index));
ttal = [RMSE,TP,FP,TN,FN,recall,precison,Acc,F1];



%% app net
list_of_of_text1 = [];
list_of_of_text2 = [];
for jj=1:10
    location = [];
   for ren=1:5
    lun = jj;
    list_length = 48;
    ren_length = 575;
    start_point = (lun-1)*list_length+(ren-1)*ren_length;
    goal =  classify(net,test_data(1+start_point:list_length+start_point,1)) ;
    goal = start_point+find(string(goal) == '1');
    location = [location;goal];
   end
    location = test_data(goall(location),4);
    [m,n] = getmn(location);
    list_of_of_text1 = [list_of_of_text1;judge(m,n)];
end

%{
for jj=1:12
    location = [];
    for ren=1:5
lun = jj;
list_length = 48;
ren_length = 575;
start_point = (lun-1)*list_length+(ren-1)*ren_length;

goal =  classify(net,train_data(1+start_point:list_length+start_point,1)) ;
goal =  start_point+find(string(goal) == '1');
location = [location;goal];

    end
  
location = train_data(goall(location),6);
[m,n] = getmn(location);
list_of_of_text2 = [list_of_of_text2;judge(m,n)];

end
%}
if sum(last_list==goal_list)<sum(list_of_of_text1==goal_list)
   last_list = list_of_of_text1;
   history_tt = ttal;
   gongxi=1+gongxi;
end
time = time+1



