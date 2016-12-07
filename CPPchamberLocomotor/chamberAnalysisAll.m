function [TiChamberAll] = chamberAnalysisAll(dataType1)
%%
c=1;
for h = 1:length(dataType1)
    data=dataType1{h};
    
    for p= [4, 6, 8]
        Differences = diff(data(:,p));
        initialShift = logicFind(1,Differences,'==') + 1;
        endShift = logicFind(-1,Differences,'==');

        if data(end,p) == 1
        endShift = [endShift,size(data,1)];
        end
    end
end


for x = 1:length(initialShift)
    time(x) = data(endShift(x),2)- data(initialShift(x),2);
end

z(c) = sum(time);
  c=c+1;
  
  %%
  
