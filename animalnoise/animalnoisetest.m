totallength = size(data,1) * size(data,2);
waves = reshape(data, [totallength, 1]);
pxx1 = RemoveNoise(pxx, 3);
idx1 = GMMCluster(pxx1',2,0.001);
clustered1 = NewClustering(idx1, 2, data);

figure;
plotclusters(waves,2,clustered1);

pxx2 = RemoveNoise(pxx, 5);
idx2 = GMMCluster(pxx2',2,0.001);
clustered2 = NewClustering(idx2, 2, data);

figure;
plotclusters(waves,2,clustered2);

pxx3 = RemoveNoise(pxx, 40:50);
idx3 = GMMCluster(pxx3',2,0.001);
clustered3 = NewClustering(idx3, 2, data);

figure;
plotclusters(waves,2,clustered3);