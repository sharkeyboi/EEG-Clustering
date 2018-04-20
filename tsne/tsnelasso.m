figure;
scatter(Y(:,1),Y(:,2), 1);
hold on;

% Scatterplot colored by 3rd parameter values (by cluster)
ignoredata = gscatter(Y(:,1),Y(:,2),idx);

% Select points wanted to highlight
indices = selectdata('selectionmode','lasso', 'ignore',ignoredata);

indices = sort(indices);

% Multiply indices selected to match time series
result = zeros(10000,length(indices));
for i = 1:length(indices)
    result(:,i) = (((indices(i)-1)*10000+1):((indices(i))*10000))';

end

% Flatten for plotting
colors = reshape(result, length(indices)*10000, 1);

plotcolors(waves,size(clusters,3),clusters,colors);
