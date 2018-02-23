function [avg] = runtestdata(numbins, regpar, numsnippets, seed)
score = 0;
for trial=1 : 2
    rng(seed(trial));
    run LoadSavedData
    subP1 = transformdata(data, numsnippets);
    %kidx1 = kmeans(subP1, numbins);
    %kidx2 = kmeans(subP1, numbins);
    idx1 = GMMCluster(subP1, numbins, regpar);
    rng(seed(trial)+99);
    idx2 = GMMCluster(subP1, numbins, regpar);
    score = score + bincomparison(idx1, idx2, numbins);
    %kscore = kscore + bincomparison(kidx1, kidx2, numbins);
end

avg = score/trial;
%kmeansavg = kscore/trial;