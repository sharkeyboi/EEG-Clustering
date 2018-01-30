Fs = 1000;
L = 10000;

denoiseddata = RemoveLineNoise(data', Fs, 'LF = 60');
denoiseddata = denoiseddata';

