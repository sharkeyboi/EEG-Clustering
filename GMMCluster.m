options = statset('Display','final');
gm = fitgmdist(subP1',numbins, 'RegularizationValue', 0.0005);

idx = cluster(gm, subP1');

figure;
 subplot(2,1,1);
samps = (subset*10000):((subset*10000)+totallength - 1);
plot(samps, waves);

subplot(2,1,2);
plot(1:length(idx), idx);