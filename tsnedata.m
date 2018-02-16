%Y = tsne(subP1);
figure;
scatter(Y(:,1),Y(:,2),1);
hold on;
ignoredata = gscatter(Y(:,1),Y(:,2),idx);
index = selectdata('selectionmode','Closest', 'ignore',ignoredata);

figure;
plot(data(:,sum(index)));
