function [output] = get_trainbill_of_onecase1(data,event,sample_numbel,title,a,b)
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
        label = (event(ii,1)==a | event(ii,1)==b);
        name_of_case = title;
        index_of_windows = ii;
        round_t = round;
        rawcc = event(ii,1);
        output = [output;{data_w,label,name_of_case,index_of_windows,round_t,rawcc}];    
       
        
    end
end

