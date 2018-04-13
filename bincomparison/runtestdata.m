function [avg] = runtestdata(numbins, regpar, seed)
score = 0;
for trial=1 : 2
    rng(seed(trial));
    run LoadSavedData
    subP1 = transformdata(data);
    idx1 = GMMCluster(subP1, numbins, regpar);
    rng(seed(trial)+99);
    idx2 = GMMCluster(subP1, numbins, regpar);
    score = score + bincomparison(idx1, idx2, numbins);
    %kscore = kscore + bincomparison(kidx1, kidx2, numbins);
end

avg = score/trial;
%kmeansavg = kscore/trial;