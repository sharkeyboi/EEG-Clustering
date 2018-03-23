% Plot difference between selcted data points against the whole dataset
cluster1 = subP1(idx==1,:);
cluster2 = subP1(idx==2,:);
selectedcluster = subP1(indices,:);
% stdshade(cluster1(:,1:30),0.1,'g',f(1:30));
% hold on;
stdshade(cluster1,0.1,'g',f);
hold on;
xlabel('Frequency (Hz)'), ylabel('Power');
stdshade(selectedcluster,0.1,'b',f);



title('Spectral Difference between Clusters');
h = findobj(gca,'Type','line');
legend(h,'Selected Cluster','Desync');
hold off;