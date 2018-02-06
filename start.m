numsnippets = input('How many samples? (Must be greater than max frequency)\n');
numbins = input('How many bins?\n');
seed = input('Random Seed?');
rng(seed);

run LoadData;
subP1 = transformdata(data, numsnippets);
idx = GMMCluster(subP1, numbins, [0.000129154966501488]);
run newclustering;
run plotclusters;
