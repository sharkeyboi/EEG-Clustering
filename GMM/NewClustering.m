%Prepare the cluster data to be presented as separate waveforms
function [clusteredwaves] = NewClustering(idx,numbins,dataset)
numsnippets = size(dataset,2);
totidx = zeros(length(idx), numbins);
for i=1: numbins
   curidx = idx;
   curidx(curidx ~= i) = 0;
   curidx(curidx == i) = 1;
   totidx(:,i) = curidx;
end


clear clusters


clusteredData = dataset;
for i=2: numbins
    clusteredData(:,:,i) = dataset;
end


for i = 1: numbins
    for j = 1:numsnippets
        clusteredData(:,j,i) = clusteredData(:,j,i) * totidx(j,i);
    end
end
totallength = size(dataset,1) * size(dataset,2);
clusteredwaves = reshape(clusteredData, [totallength, 1, numbins]);
end