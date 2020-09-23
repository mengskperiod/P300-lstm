function [count_List] = get_the_location(possible_point,event)
possible_point = possible_point;
event_time = event(:,2);
event_order = event(:,1);
count_List = zeros(12,1);

range_of_possible = [possible_point-20,possible_point+20];

 for ii=1:size(range_of_possible,1)
     succeful_index = find (event_time >= range_of_possible(ii,1) &  event_time <= range_of_possible(ii,2));
   
     succeful_index(event_order(succeful_index)>=100)=[];
    
     
     for jj=1:length(succeful_index)
         count_List(event_order(succeful_index(jj))) = count_List(event_order(succeful_index(jj)))+1;
     end
     
%{
 m = find(count_List == max(count_List(7:12))) ;
 m = m(end);
 n = find(count_List == max(count_List(1:6))) ;
 n = n(1);
%} 
 
     
 end

