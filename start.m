numsnippets = input('How many samples? (Must be greater than max frequency)\n');
numbins = input('How many bins?\n');
seed = input('Random Seed?');
rng(seed);
regparam = 0.001;

run LoadData;
subP1 = transformdata(data, numsnippets);
idx = GMMCluster(subP1, numbins, regparam);

run LoadData;
subP1 = transformdata(data, numsnippets);
idx = GMMCluster(subP1, numbins, [0.000129154966501488]);
run newclustering;
plotclusters(waves,numbins,clusteredwaves);
