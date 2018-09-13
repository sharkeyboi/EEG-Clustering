function [C] = tsnedata(idx,numbins,Y)
cmap = colormap('jet');
interval = floor(64/numbins);
C = cmap(64:-interval:1,:);

scatter(Y(:,1),Y(:,2),1);
hold on;
ignoredata = gscatter(Y(:,1),Y(:,2),idx, C,'.',10);
% index = selectdata('selectionmode','Closest', 'ignore',ignoredata);

% figure;
% plot(data(:,sum(index)));
end