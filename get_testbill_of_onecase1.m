function [output] = get_testbill_of_onecase1(data,event,sample_numbel,title)
output = {} ;
round = 0;
    for ii=1:size(event,1)
        if event(ii,1) >=100
            round=round+1;
            continue
        end
        
        data_z = zscore(data(event(ii,2):event(ii,2)+sample_numbel,:))';
        data_w=[];
        for jj=1:size(data_z,1)
            [c,l] = wavedec(data_z(jj,:),2,'db2');
            a4 = appcoef(c,l,'db2',2);
            data_w = [data_w;a4];
        end
        name_of_case = title;
        index_of_windows = ii;
        rawcc = event(ii,1);
        round_t = round;
        output = [output;{data_w,name_of_case,index_of_windows,rawcc,round_t}]; 




end

