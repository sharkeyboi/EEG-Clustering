totidx = zeros(length(idx), numbins);
for i=1: numbins
   curidx = idx;
   curidx(curidx ~= i) = 0;
   curidx(curidx == 1) = 1;
   totidx(:,i) = curidx;
end


clear clusters


clusteredData = data;
for i=2: numbins
    clusteredData(:,:,i) = data;
end


for i = 1: numbins
    for j = 1:numsnippets
        clusteredData(:,j,i) = clusteredData(:,j,i) * totidx(j,i);
    end
end
clusteredwaves = reshape(clusteredData, [totallength, 1, numbins]);
