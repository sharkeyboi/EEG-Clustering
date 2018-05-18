function [idx,P, BIC, gm] = GMMCluster(dataset, k, regval, reps)

if regval == 0
    gm = fitgmdist(dataset, k, 'Options', statset('MaxIter',1000));
else
gm = fitgmdist(dataset, k, 'RegularizationValue', regval, 'Replicates', reps, 'Options', statset('MaxIter', 1000,'Display','iter', 'TolFun', 1e-6));
end
idx = cluster(gm, dataset);
P = posterior(gm, dataset);
BIC = gm.BIC;
gm = gm;
end
