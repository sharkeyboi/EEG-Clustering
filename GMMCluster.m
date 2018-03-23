function [idx] = GMMCluster(dataset, k, regval)

gm = fitgmdist(dataset, k, 'RegularizationValue', regval);
idx = cluster(gm, dataset);

end
