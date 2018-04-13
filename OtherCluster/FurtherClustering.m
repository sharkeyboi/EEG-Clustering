if length(find(idx==1)) > length(find(idx==2))
    binnumber = 1;
else
    binnumber = 2;
end

numbins = input('How many sub-bins?');

subidx1 = GMMCluster(subP1(find(idx==binnumber),:), numbins, regparam);
rng(binnumber);
subidx2 = GMMCluster(subP1(find(idx==binnumber),:), numbins, regparam);
indices = find(idx==binnumber);

accuracy = bincomparison(subidx1,subidx2,numbins)

numSubSnippets = length(subidx1);
totsubidx = zeros(length(subidx1), numbins);
totalidx = totidx(:,binnumber);
totalidx(:,2) = totidx(:,binnumber);
for i=1: numbins
   curidx = subidx1;
   curidx(curidx ~= i) = 0;
   curidx(curidx == 1) = 1;
   totsubidx(:,i) = curidx;
   totalidx(indices,i) = curidx;
end

subClusteredData = data;
for i=2: numbins
    subClusteredData(:,:,i) = data;
end


for i = 1: numbins
    for j = 1:numSubSnippets
        subClusteredData(:,j,i) = subClusteredData(:,j,i) * totalidx(j,i);
    end
end
subTotallength = length(idx) * 10000;
subClusteredWaves = reshape(subClusteredData, [subTotallength, 1, numbins]);
subTotalData = clusteredData(:,:,binnumber);
subTotalWaves = reshape(subTotalData, [subTotallength, 1, 1]);

figure;
title("Subclusters");

plotclusters(subTotalWaves,numbins,subClusteredWaves);
