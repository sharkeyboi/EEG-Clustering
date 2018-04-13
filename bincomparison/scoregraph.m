
regparams = linspace(1e-5,1e-3, 30);
bins = 2:7;
seeds = randi([0,100],30,1);
allscores = zeros(length(regparams),length(bins));

for i = 1 : length(regparams)
    for j = 1 : length(bins)
        allscores(i,j) = runtestdata(bins(j),regparams(i),5207,seeds);
    end
end

for i = 1:length(bins)
    plot(regparams, allscores(:,i));
    hold on
end
hold off
legend('2 Clusters', '3 Clusters','4 Clusters', '5 Clusters', '6 Clusters', '7 Clusters');
xlabel('Regularization Parameter'), ylabel('Clustering Accuracy'), title('GMM Parameter Study');


saveas(gcf,'output.png');