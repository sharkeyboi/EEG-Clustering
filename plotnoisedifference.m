figure;
subplot(3,1,1);
samps = (subset*10000):((subset*10000)+totallength - 1);
plot(samps, waves);

subplot(3,1,2);
denoisedwaves = reshape(denoiseddata, [totallength, 1]);
plot(samps, denoisedwaves);


subplot(3,1,3);
differencewaves = waves - denoisedwaves;
plot(samps, differencewaves);
ylim([-1 1]);