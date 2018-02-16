figure;
scatter(Y(:,1),Y(:,2), 1);
hold on;
ignoredata = gscatter(Y(:,1),Y(:,2),idx);
indices = selectdata('selectionmode','lasso', 'ignore',ignoredata);

indices = sort(indices);

result = zeros(10000,length(indices));
for i = 1:length(indices)
    result(:,i) = (((indices(i)-1)*10000+1):((indices(i))*10000))';

end

colors = reshape(result, length(indices)*10000, 1);

plotcolors(waves,2,clusteredwaves,colors);


