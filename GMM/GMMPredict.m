function [idx,P] = GMMPredict(dataset, gm)

idx = cluster(gm, dataset);
P = posterior(gm, dataset);
end
