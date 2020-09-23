clc
clear 
load databill.mat
total_train_data={};
total_train_label={};

for S_number=1:5
    people_name = ['S',num2str(S_number)];
    eval(['str_number=length(',people_name,'train.train_dataSheet);'])
    for str_index=1:str_number
        eval(['data =', people_name,'train.data',num2str(str_index),';']);  %ÇĞ»»²¡ÈË
        eval(['event =', people_name,'train.event',num2str(str_index),';']);  %ÇĞ»»²¡ÈË   
        wave_data=[];

            for ii=1:20
            list_data = data(:,ii); %ÇĞ»»ÊôĞÔ
            [c,l] = wavedec(data(:,ii),6,'db6');
            a6 = appcoef(c,l,'db6',6);
            wave_data = [wave_data,a6];
            end
        wave_data = wave_data';
        total_train_data{end+1,1} = wave_data;
    end
end

time = event((event(:,1)==1|event(:,1)==8),2);
time = time+100;
label = ceil(time/64);
Y = zeros(59,1);
Y(label)=1;

net = newff(minmax(total_train_data{1,1}),minmax(Y'),[100,50],{'tansig','purelin','tansig'});

net = train(net,total_train_data{1,1},Y');

sim(net,total_train_data{13,1})




