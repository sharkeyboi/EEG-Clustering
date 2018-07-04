function [statistics] = statisticalClustering(data)

    statdata = data / max(max(abs(data)));

    statdata = statdata';
    mins = min(statdata);
    maxs = max(statdata);
    means = mean(statdata);
    medians = median(statdata);
    modus = mode(statdata);
    firstquartile = quantile(statdata, 0.25);
    thirdquartile = quantile(statdata, 0.75);
    r = iqr(statdata);
    stds = std(statdata);

    statistics = [mins; maxs; means; medians;firstquartile; thirdquartile;stds];

%     [statidx,statP,statBIC,statgm] = GMMCluster(statistics',8,0,10);
%     statd2 = mahal(statgm,statistics');
%     statclusters = NewClustering(statidx,8,FilteredData);
%     RecreateKmeans(statidx,8,filteredpxx,statd2,statclusters, f, Y);
end