clc
clear all
load databill.mat
%����test_data
test_data={};
test_data1={};
% test_data{:,1}---- data
% test_data{:,2}---- name_of_case     �ڼ����ַ�
% test_data{:,3}---- index_of_windows �ڼ�������
% test_data{:,4}-----rawcc              �ò�����Ӧ������
% test_data{:,5}---- round �ò����ڵڼ���

windows = 0.64;
sample_numbel = windows * 250;

index_matrix = reshape([101:136],6,6)';


for people_case=1:5
    
    people_name = ['S',num2str(people_case)];%�л�����
    eval(['str_number=length(',people_name,'test.test_dataSheet);'])

   for str_index=1:str_number
        title = [people_name,'test',num2str(str_index)];
        eval(['data =', people_name,'test.data',num2str(str_index),';']);  %�л��ַ�
        eval(['event =', people_name,'test.event',num2str(str_index),';']);  %�л��ַ�
        
        data_afte_filter = bandsome_filter(data);
      
         test_data = [test_data;get_testbill_of_onecase(data,event,sample_numbel-1,title)];
         test_data1 = [test_data1;get_testbill_of_onecase1(data,event,sample_numbel-1,title)];
        
   end
end   
clearvars -except test_data test_data1
save test_data
save('test_data.mat','test_data');
save('test_data1.mat','test_data1')



