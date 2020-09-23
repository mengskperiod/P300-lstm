function [ RMSE,TP,FP,TN,FN,recall,precison,Acc,F1] = show_result( text_result,expect_result )
TP=0;
FP=0;
TN=0;
FN=0;
text_result=double(string(text_result));
expect_result=double(string(expect_result));

RMSE=([text_result-expect_result]'*[text_result-expect_result]/length(text_result))^0.5;
     for ii=1:length(text_result)
         if text_result(ii)==expect_result(ii)
             if text_result(ii)==1
                 TP=TP+1;
             else
                 TN=TN+1;
             end
         else
             if  text_result(ii)==1
                 FP=FP+1;
             else
                 FN=FN+1;
             end
         end
     end
     
  recall=TP/(TP+FN);
  precison=TP/(TP+FP);
  Acc=(TP+TN)/(TP+FN+FP+TN);
  F1 = 2*(precison*recall)/(precison+recall);
  
end

