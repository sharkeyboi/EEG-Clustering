C = ['k','b','r','g','y','c','m'];
for itr = 1.5:0.5:3
[pxx, freq, pcascore] =transformdata(data, [itr, 0.001]);
Y = tsne(pxx');
idx = GMMCluster(pcascore(:,1:100),5,0,15);
clusters = NewClustering(idx,5,data);
plotclusters(waves,5,clusters);
figure;
gscatter(Y(:,1),Y(:,2),idx, C,'.',10);
end