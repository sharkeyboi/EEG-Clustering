function [data] = medianfilter(indata,ws, range)
    arr = zeros(size(range));
    for itr = range
        tmp = indata(itr-(ws/2):itr+(floor(ws/2))+1);
        tmp = sort(tmp);
        arr(itr-range(1)+1) = tmp(floor(ws/2)+1);
    end
    
    data = indata;
    data(range) = arr;
end