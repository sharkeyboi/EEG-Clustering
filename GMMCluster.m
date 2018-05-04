function [idx,P, BIC] = GMMCluster(dataset, k, regval)

if regval == 0
    gm = fitgmdist(dataset, k, 'Options', statset('MaxIter',1000));
else
gm = fitgmdist(dataset, k, 'RegularizationValue', regval, 'Options', statset('MaxIter', 1000));
end
idx = cluster(gm, dataset);
P = posterior(gm, dataset);
BIC = gm.BIC;
end
