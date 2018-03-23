Fs = 1000;
L = 10000;
figure;
select = input('Select a wave(1-5139)');
x = data(:,select);
plot(x);
title('Single Waveform');
xlabel('Time (ms)');
ylabel('Voltage (V)');

figure;
Y = fft(x);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;
subplot(2,1,1);
plot(f,10*log10(P1))
title('Logspace');
ylabel('Gain');
xlabel('Frequency (Hz)');
subplot(2,1,2);
plot(f,P1)
title('Linear Space');
ylabel('Power');
xlabel('Frequency (Hz)');

figure;

[pxx,freq] = periodogram(x,hann(length(x)),[],Fs);
subplot(2,1,1);
plot(freq,10*log10(pxx));
title('Logspace (Hanning Window)');
ylabel('Gain');
xlabel('Frequency (Hz)');
subplot(2,1,2);
plot(freq,pxx)
title('Linear Space (Hanning Window)');
ylabel('Power');
xlabel('Frequency (Hz)');

figure;

smoothedpxx = imgaussfilt(pxx);
subplot(2,1,1);
plot(freq,10*log10(smoothedpxx));
title('Logspace (Smoothed)');
ylabel('Gain');
xlabel('Frequency (Hz)');
subplot(2,1,2);
plot(freq,smoothedpxx)
title('Linear Space (Smoothed)');
ylabel('Power');
xlabel('Frequency (Hz)');
