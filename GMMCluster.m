k = 7

options = statset('Display','final');
gm = fitgmdist(P1',k,'Options',options, 'RegularizationValue', 0.1)

idx = cluster(gm, P1);

t = 1:length(idx);
plot(t, idx);