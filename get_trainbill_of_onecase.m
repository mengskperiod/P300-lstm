function [output] = get_trainbill_of_onecase(data,event,sample_numbel,title,a,b)
output = {} ;
round = 0;
    for ii=1:size(event,1)
        if event(ii,1) >=100
            round=round+1;
            continue
        end
        
        data_w = (data(event(ii,2):event(ii,2)+sample_numbel,:))';
        label = (event(ii,1)==a | event(ii,1)==b);
        name_of_case = title;
        index_of_windows = ii;
        round_t = round;
        rawcc = event(ii,1);
        output = [output;{data_w,label,name_of_case,index_of_windows,round_t,rawcc}];    
        
        
    end
end

