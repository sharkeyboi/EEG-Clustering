% Plots mean of data and std (shaded)
figure
cluster1 = subP1(idx==1,:);
cluster2 = subP1(idx==2,:);

stdshade(cluster1,0.1,'g',f);
hold on;
stdshade(cluster2,0.1,'b',f);
xlabel('Frequency (Hz)'), ylabel('Power');

title('Spectral Difference between Clusters');
h = findobj(gca,'Type','line');
legend(h,'Desync','Sync');