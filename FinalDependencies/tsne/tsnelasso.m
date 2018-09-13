cmap = colormap('jet');

interval = floor(64/numbins);
C = cmap(64:-interval:1,:);
figure;
scatter(Y(:,1),Y(:,2), 1);
hold on;

% Scatterplot colored by 3rd parameter values (by cluster)
ignoredata = gscatter(Y(:,1),Y(:,2),statidx, C,'.',10);

% Select points wanted to highlight
indices = selectdata('selectionmode','lasso', 'ignore',ignoredata);

indices = sort(indices);

% Multiply indices selected to match time series
result = zeros(1000,length(indices));
for i = 1:length(indices)
    result(:,i) = (((indices(i)-1)*1000+1):((indices(i))*1000))';

end

% Flatten for plotting
colors = reshape(result, length(indices)*1000, 1);

plotcolors(numbins,clusters,colors, waves);
