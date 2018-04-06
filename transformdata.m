function [pxx, f] = transformdata(dataset, numsnippets)


%%%%%%%%%%%% Periodogram %%%%%%%%%%%%%
rng default
Fs = 1000;


[pxx,f] = periodogram(dataset,hann(length(dataset)),length(dataset),Fs);

% smoothed = zeros(size(pxx));
% for i = 1:numsnippets
%     smoothed(:,i) = smooth(pxx(:,i));
% end

% pxx = smoothed;

% title('Periodogram Using FFT')
% xlabel('Frequency (Hz)')
% ylabel('Power/Frequency (dB/Hz)')

end
