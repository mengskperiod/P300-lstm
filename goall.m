function [output] = goall(goal)
      output = [];
       for ii=1:length(goal)
           if goal(ii) ==1
               output = [output,goal(ii),goal(ii),goal(ii)+1,goal(ii)+2];
           else if goal(ii) == length(goal)
               output = [output,goal(ii),goal(ii),goal(ii)-1,goal(ii)-2];   
               else
               output = [output,goal(ii),goal(ii),goal(ii)-1,goal(ii)+1,goal(ii)+2]; 
           end
       end
end

