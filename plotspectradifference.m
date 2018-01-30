fftdata = fft(data);


P2 = abs(fftdata/L);
P1 = P2(1:L/2+1,:);
P1(2:end-1) = 2*P1(2:end-1);

f = Fs*(0:(L/2))/L;

fMax = min(size(P1,1), numsnippets);
fMax = min(fMax,750);

f = f(2:fMax);

subP1 = P1(2:fMax, :);
figure('Name', 'Line Noise Removal');

subplot(3,1,1);
plot(f,subP1(:,1));
title('Original Power Spectrum');

denoisedfft = fft(denoiseddata);

dnP2 = abs(denoisedfft/L);
dnP1 = dnP2(1:L/2+1,:);
dnP1(2:end-1) = 2*dnP1(2:end-1);
subdnP1 = dnP1(2:fMax, :);

subplot(3,1,2);
plot(f,subdnP1(:,1));
title('Denoised Power Spectrum');
ylabel('Power');


subplot(3,1,3);
differenceP1 = subP1(:,1) - subdnP1(:,1);
plot(f, differenceP1);
title('Difference');
xlabel('Frequency (Hz)');