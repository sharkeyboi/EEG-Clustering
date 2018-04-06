% Plots mean of data and std (shaded)
figure
pxxt = pxx';
cluster1 = pxxt(idx==1,:);
cluster2 = pxxt(idx==2,:);

stdshade(cluster1(:,1:30),0.1,'g',f(1:30));
hold on;
stdshade(cluster2(:,1:30),0.1,'b',f(1:30));
xlabel('Frequency (Hz)'), ylabel('Power');

title('Spectral Difference between Clusters');
h = findobj(gca,'Type','line');
legend(h,'Desync','Sync');