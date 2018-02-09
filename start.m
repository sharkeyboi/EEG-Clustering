numsnippets = input('How many samples? (Must be greater than max frequency)\n');
numbins = input('How many bins?\n');
seed = input('Random Seed?');
rng(seed);
<<<<<<< HEAD
regparam = 0.001;

run LoadData;
subP1 = transformdata(data, numsnippets);
idx = GMMCluster(subP1, numbins, regparam);
=======

run LoadData;
subP1 = transformdata(data, numsnippets);
idx = GMMCluster(subP1, numbins, [0.000129154966501488]);
>>>>>>> 77caef03953423d0bfd25a1b0ce65a45316319ea
run newclustering;
plotclusters(waves,numbins,clusteredwaves);
