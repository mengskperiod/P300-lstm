clc
clear 
load databill.mat

data = S1train.data1;  %切换病人
event = S1train.event1;
index = find(event(:,1)>=100);
time = event(index,2);
count_matrix =zeros(12,1);

%%
for ii=1:20
list_data = data(:,ii); %切换属性
[c,l] = wavedec(data(:,ii),6,'db6');
a6 = appcoef(c,l,'db6',6);
a3 = appcoef(c,l,'db4',3);
a2 = appcoef(c,l,'db4',2);

da6 = diff(a6);
%da6 = abs(da6);

Q1 = quantile(da6,0.75,1); %四分数点
%Q1 = mean(da2(da2>mean(da2)));

possible_point = find(da6>=Q1);
possible_point = possible_point*64;
[countlist] = get_the_location(possible_point,event);
count_matrix = count_matrix+countlist;

end


