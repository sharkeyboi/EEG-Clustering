for i = 1:numbins
    zeroCounter(i) = nnz((clusteredData(:,:,i)));
end

[orderedZeroCounter,index]=sort(zeroCounter,'descend');
% ordered = [index(:), clusteredData(:,:,)];
% o = 
% ordered = sort(ordered, 'descend');
% disp(ordered(:));


newClusteredData = clusteredData(:,:,index(1:2));
clusteredData = newClusteredData;

numbins = size(clusteredData,3);
