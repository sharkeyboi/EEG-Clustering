function [Iblur, f, pcascore] = transformdata(dataset, smoothing)


%%%%%%%%%%%% Periodogram %%%%%%%%%%%%%
rng default
Fs = 1000;


[pxx,f] = periodogram(dataset,hann(length(dataset)),length(dataset),Fs);

% sigma = 80;
% sz = 30;    % length of gaussFilter vector
% x = linspace(-sz / 2, sz / 2, sz);
% gaussFilter = exp(-x .^ 2 / (2 * sigma ^ 2));
% gaussFilter = gaussFilter / sum (gaussFilter);
% pxx = filter(gaussFilter,1,10*log(pxx),[],2);

pxx = imgaussfilt(log(pxx),smoothing);

%%Only keep frequencies through 100 Hz
pxx = pxx(1:401,:);
f = f(1:401);
%% Optional: amplify differences, by subtracting the mean spectrum
Iblur = pxx-repmat(mean(pxx,2),[1 size(pxx,2)]);

%% Optional: zscore (whiten) the spectra
Iblur = zscore(Iblur,[],1);

[coeff,pcascore]= pca(Iblur');
end
