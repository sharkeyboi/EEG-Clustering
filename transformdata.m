function [pxx, f] = transformdata(data, numsnippets)

usePeriodogram = input('Use periodogram?');

if usePeriodogram == 0
Fs = 1000;
L = length(data);


fftdata = fft(data);

% P2 is set to be the whole power spectra and P1 drops the
% imaginary values
P2 = abs(fftdata/L);
P1 = P2(1:L/2+1,:);
P1(2:end-1) = 2*P1(2:end-1);

% Calculate frequency for use later
f = Fs*(0:(L/2))/L;

% GMM works on a subset of the data only in the case that the number of
% frequencies is less than the number of snippets used in the algorithm
% Minimum of the two is taken here

fMax = min(size(P1,1), numsnippets);
% fMax = min(fMax,5000);

f = f(2:fMax);

% Frequencies by snippets
subP1 = P1(2:fMax, :);
% figure;
% for i = 1:9
%     subplot(3,3,i);
%     plot(f,subP1(:,i))
% end

subP1 = subP1';

else
%%%%%%%%%%%% Periodogram %%%%%%%%%%%%%
rng default
Fs = 1000;
%t = 0:1/Fs:1-1/Fs;
x = data;
[pxx,f] = periodogram(x,hann(length(x)),[],Fs);

smoothdata = imgaussfilt(pxx);
plot(f,10*log10(smoothdata())
% plot(smoothdata,10*log10(psdx))
% disp(size(psdx));
% grid on
title('Periodogram Using FFT')
xlabel('Frequency (Hz)')
ylabel('Power/Frequency (dB/Hz)')

end

end