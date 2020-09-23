function train_data=f(train_data)
for i =1:length(train_data)
    tempdata=train_data(i,1);
    tempdata=tempdata{:};
    tempdata1=zeros(10,11,160);
    tempdata1(3,6,:)=tempdata(1,:);
    tempdata1(3,4,:)=tempdata(2,:);
    tempdata1(3,8,:)=tempdata(3,:);
    tempdata1(5,6,:)=tempdata(4,:);
    tempdata1(5,3,:)=tempdata(5,:);
    tempdata1(5,8,:)=tempdata(6,:);
    tempdata1(5,2,:)=tempdata(7,:);
    tempdata1(5,10,:)=tempdata(8,:);
    tempdata1(6,4,:)=tempdata(9,:);
    tempdata1(6,8,:)=tempdata(10,:);
    tempdata1(6,3,:)=tempdata(11,:);
    tempdata1(6,9,:)=tempdata(12,:);
    tempdata1(7,6,:)=tempdata(13,:);
    tempdata1(7,4,:)=tempdata(14,:);
    tempdata1(7,8,:)=tempdata(15,:);
    tempdata1(7,2,:)=tempdata(16,:);
    tempdata1(7,10,:)=tempdata(17,:);
    tempdata1(10,6,:)=tempdata(18,:);
    tempdata1(10,5,:)=tempdata(19,:);
    tempdata1(10,7,:)=tempdata(20,:);
    train_data(i,1)={tempdata1};
    
    
    
end

end