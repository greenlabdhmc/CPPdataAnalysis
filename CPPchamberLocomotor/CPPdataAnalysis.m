function [output] = CPPdataAnalysis(filedata)
%%
    [~,sheets] = xlsfinfo(filedata);

        for s=1:numel(sheets)
        newdata{s} = xlsread(filedata,s);   
        end
%%
    [TiChamberAll, chamberCountAll] = chamberAnalysis(newdata); 
%%
output = array2table([TiChamberAll(:,1); chamberCountAll(:,1); TiChamberAll(:,2); chamberCountAll(:,2); TiChamberAll(:,3); chamberCountAll(:,3)]);
output.Properties.VariableNames = {'Chamber1Time', 'Chamber1Count','Chamber2Time', 'Chamber2Count','Chamber3Time', 'Chamber3Count'};
output.Properties.RowNames = {sheets.name};
end