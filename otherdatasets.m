for itr = 2:13
    currentdata = alldata{itr};
    currentdata = FilterData(currentdata);
    [pxx, f, pcascore,explained] = transformdata(currentdata, 2,5);
    [idx,P,BIC,gm] = GMMCluster(pcascore(:,1:20),8,0,10);
    d2 = mahal(gm,pcascore(:,1:20));
    clusters = NewClustering(idx,8,currentdata);
    Y = tsne(pxx');
    RecreateKmeans(idx,8,pxx,d2,clusters, f, Y, 'otherdatasets/',itr);
    close;
end
[pxx, f, pcascore,explained] = transformdata(data, 2,5);
[idx,P,BIC,gm] = GMMCluster(pcascore(:,1:20),8,0,10);
for itr = 1:13
    currentdata = alldata{itr};
    currentdata = FilterData(currentdata);
    [pxx, f, pcascore,explained] = transformdata(currentdata, 2,5);
    [idx,P] = GMMPredict(pcascore(:,1:20),gm);
    d2 = mahal(gm,pcascore(:,1:20));
    clusters = NewClustering(idx,8,currentdata);
    Y = tsne(pxx');
    RecreateKmeans(idx,8,pxx,d2,clusters, f, Y, 'otherdatasetsinitialmodel/',itr);
    close;
end