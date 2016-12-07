function [pixelsum] = CPPlocomotor(data)
%%
ii=1;
    for a = [4, 6, 8]
        datasub=diff(data(:,a));
        dataInitial=logicFind(1,datasub,'==')+1;
        dataFinal=logicFind(-1,datasub,'==');


        if data(end,a) == 1
            dataFinal = [dataFinal,size(data,1)];
        end
           
        for c = 1:length(dataInitial)
            pixel(c)= data(dataFinal(c),a+1)- data(dataInitial(c),a+1);
            pixel1(ii) = sum(pixel);
            ii = ii+1;
        end
    
    end
pixelsum=sum(pixel1);
