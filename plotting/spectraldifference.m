% Plots mean of data and std (shaded)
figure
pxxt = pxx';
cluster1 = pxxt(idx==1,:);
cluster2 = pxxt(idx==2,:);

stdshade(cluster1,0.1,'g',freq);
hold on;
stdshade(cluster2,0.1,'b',freq);
xlabel('Frequency (Hz)'), ylabel('Power');

title('Spectral Difference between Clusters');
h = findobj(gca,'Type','line');
legend(h,'Desync','Sync');