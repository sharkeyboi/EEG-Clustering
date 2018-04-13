k = 7

options = statset('Display','final');
gm = fitgmdist(data,k,'Options',options, 'RegularizationValue',0.1)