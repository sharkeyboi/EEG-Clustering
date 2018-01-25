k = 7

options = statset('Display','final');
gm = fitgmdist(subP1',k);

idx = cluster(gm, subP1');


subplot(2,1,1);
samps = (subset*10000):((subset*10000)+totallength - 1);
plot(samps, waves);

subplot(2,1,2);
plot(t, idx);