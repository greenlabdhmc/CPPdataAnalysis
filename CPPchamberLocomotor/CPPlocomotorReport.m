function [output] = CPPlocomotorReport(sdir)
%%
cd(sdir)
files = dir('*.csv');

for f = 1:length(files)
    data{f} = csvread(files(f).name,1,0); 
end
%%

    for d=1:length(data)
        [pixelsum(d)] = CPPlocomotor(data{d});
       
    end
%%
output = array2table([pixelsum]');
output.Properties.VariableNames = {'TotalPixelsMoved'};
output.Properties.RowNames = {files.name};