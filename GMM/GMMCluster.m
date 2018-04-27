function [idx,P] = GMMCluster(dataset, k, regval)

if regval == 0
    disp('No regparam');
    gm = fitgmdist(dataset, k);
else
gm = fitgmdist(dataset, k, 'RegularizationValue', regval);
end
idx = cluster(gm, dataset);
P = posterior(gm, dataset);
end
