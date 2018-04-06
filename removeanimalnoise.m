%Remove ventilation and heartbeat noise
%pxx(:,3) = 0;
%pxx(:,5) = 0;
pxx(:,40:50)=0;


numbins=2;
idx = GMMCluster(pxx', 2, 0.001);
run newclustering
run spectraldifference
plotclusters(waves, 2, clusteredwaves);