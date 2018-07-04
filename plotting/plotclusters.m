function [] = plotclusters(idx, data, Y)
clusteredWave = NewClustering(idx,max(idx),data);
figure;
subplot(2,1,1);
datalength = length(clusteredWave);
cmap = colormap('jet');
interval = floor(64/size(clusteredWave,3));
C = cmap(64:-interval:1,:);

for itr = 1:size(clusteredWave,3)
plot(1:datalength, clusteredWave(:,:,itr),'Color',C(itr,:));
%Set the axis limits to be the min and max of the data
axis([0 inf min(min(clusteredWave)) max(max(clusteredWave))]);
hold on;
end

subplot(2,1,2);
tsnedata(idx,max(idx),Y);
end