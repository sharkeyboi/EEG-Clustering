function [pxx, f] = transformdata(dataset)


%%%%%%%%%%%% Periodogram %%%%%%%%%%%%%
rng default
Fs = 1000;


[pxx,f] = periodogram(dataset,hann(length(dataset)),length(dataset),Fs);

sigma = 20;
sz = 30;    % length of gaussFilter vector
x = linspace(-sz / 2, sz / 2, sz);
gaussFilter = exp(-x .^ 2 / (2 * sigma ^ 2));
gaussFilter = gaussFilter / sum (gaussFilter);
pxx = filter(gaussFilter,1,pxx,[],2);

%%Only keep frequencies through 100 Hz
pxx = pxx(2:1001,:);
f = f(2:1001);

end
