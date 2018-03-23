%%This script runs the entire clustering task using Gaussian Mixture Model

numsnippets = input('How many samples? (Must be greater than max frequency)\n');

%2 bins highest accuracy in parameter search
numbins = 2 %input('How many bins?\n');
seed = 99   %input('Random Seed?');
rng(seed);

%Regularization parameter selected from parameter search
regparam = 0.001;

run LoadData;

%Obtain the power spectrum for each snippet
subP1 = transformdata(data, numsnippets);

%Use GMM Clustering to create vector of cluster assignments
idx = GMMCluster(subP1, numbins, regparam);


%Creates matrix of waveforms grouped by cluster and plots
run newclustering;
plotclusters(waves,numbins,clusteredwaves);
