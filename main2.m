clc
clear all
load databill.mat
%����train_data
train_data={};
train_data1={};
% train_data{1,:}---- data
% train_data{2,:}---- label
% train_data{3,:}---- name_of_case     �ڼ����ַ�
% train_data{4,:}---- index_of_windows �ڼ�������
% train_data{5,:}---- round �ò����ڵڼ���
% train_data{6,:}-----rawcc�ò�����Ӧ������

windows = 0.64;
sample_numbel = windows * 250;

index_matrix = reshape([101:136],6,6)';





for people_case=1:5
    
    people_name = ['S',num2str(people_case)];%�л�����
    eval(['str_number=length(',people_name,'train.train_dataSheet);'])
    
    for str_index=1:str_number
        title = [people_name,'train',num2str(str_index)];
        eval(['data =', people_name,'train.data',num2str(str_index),';']);  %�л��ַ�
        eval(['event =', people_name,'train.event',num2str(str_index),';']);  %�л��ַ�
        
        data_afte_filter = bandsome_filter(data);
        
        [a,b] = find(index_matrix == event(1,1)) ;
        b = b+6;
        
        train_data = [train_data;get_trainbill_of_onecase(data,event,sample_numbel-1,title,a,b)];
        train_data1 = [train_data1;get_trainbill_of_onecase1(data,event,sample_numbel-1,title,a,b)];

        
        
    end    
        
end    
        
clearvars -except train_data train_data1
save('train_data.mat','train_data');
save('train_data1.mat','train_data1')
    
        
        
        