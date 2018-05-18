figure;
C = ['k','b','r','g','y','c','m'];
scatter(Y(:,1),Y(:,2),1);
hold on;
ignoredata = gscatter(Y(:,1),Y(:,2),idx, C,'.',10);
% index = selectdata('selectionmode','Closest', 'ignore',ignoredata);

% figure;
% plot(data(:,sum(index)));
