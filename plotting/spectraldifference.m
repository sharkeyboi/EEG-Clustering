% Plots mean of data and std (shaded)

kidx = kmeans(pxx',7);
[idx,P] = GMMCluster(pxx',7,0.001);
figure;
pxxt = pxx';
C = {'k','b','r','g','y','c','m'};
clear clusterspec;

for itr = 1:7
    clusterspec{itr} = pxxt(idx==itr,:);
end


for itr = 1:7
    stdshade(clusterspec{itr},0.1, C{itr}, freq);
    hold on;
end

xlabel('Frequency (Hz)'), ylabel('Power');

title('Spectral Difference between Clusters');
h = findobj(gca,'Type','line');
legend(h,'Desync','Sync');

figure

clear clusterspec;

for itr = 1:7
    kclusterspec{itr} = pxxt(kidx==itr,:);
end


for itr = 1:7
    stdshade(kclusterspec{itr},0.1, C{itr}, freq);
    hold on;
end

xlabel('Frequency (Hz)'), ylabel('Power');

title('Spectral Difference between Clusters');
h = findobj(gca,'Type','line');
legend(h,'Desync','Sync');