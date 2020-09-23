function [m,n] = getmn(location)
zz =[];
total=[];
   for ii=1:length(location)
       zz = [zz,location{ii,1}];
   end
   
   for jj=1:12
       total(jj,1) = sum(zz==jj);
   end
   
   ti = total(7:12)==max(total(7:12));
   m = find(ti==1)+6;
   
   ti = total(1:6)==max(total(1:6));
   n = find(ti==1);

end

