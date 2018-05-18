[pxx, f, pcascore] = transformdata(data,[2,0.1]);
[idx,P,BIC,gm] = GMMCluster(pcascore(:,1:20),5,0,15);
d2 = mahal(gm,pcascore(:,1:20));
clusters = NewClustering(idx,5,data);
RecreateKmeans(idx,5,pxx,d2,waves,clusters);