% Run kmeans clustering on power spectra and plot sample
idx = kmeans(subP1',7);
t = subset:(subset+numsamples-1);

totallength = size(data,1) * size(data,2);

waves = reshape(data, [totallength, 1]);

subplot(2,1,1);
samps = (subset*10000):((subset*10000)+totallength - 1);
plot(samps, waves);

subplot(2,1,2);
plot(t, idx);