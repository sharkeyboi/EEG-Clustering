MU1 = [2 2];
SIGMA1 = [2 0; 0 1];
MU2 = [-2 -1];
SIGMA2 = [1 0; 0 1];
rng(1); % For reproducibility
X = [mvnrnd(MU1,SIGMA1,1000);mvnrnd(MU2,SIGMA2,1000)];

idx1 = GMMCluster(X,2);
rng(3);
idx2 = GMMCluster(X, 2);
numbins = 2;
run bincomparison;