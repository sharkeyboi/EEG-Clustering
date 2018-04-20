function [pxx, f] = transformdata(dataset)


%%%%%%%%%%%% Periodogram %%%%%%%%%%%%%
rng default
Fs = 1000;


[pxx,f] = periodogram(dataset,hann(length(dataset)),length(dataset),Fs);

sigma = 80;
sz = 30;    % length of gaussFilter vector
x = linspace(-sz / 2, sz / 2, sz);
gaussFilter = exp(-x .^ 2 / (2 * sigma ^ 2));
gaussFilter = gaussFilter / sum (gaussFilter);
pxx = filter(gaussFilter,1,10*log(pxx),[],2);

%%Only keep frequencies through 100 Hz
pxx = pxx(1:401,:);
f = f(1:401);

end
