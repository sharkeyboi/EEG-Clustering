fftdata = fft(data);
Fs = 1000;
L = 10000;
P2 = abs(fftdata/L);
P1 = P2(1:L/2+1,:);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;

for i = 1:9
    subplot(3,3,i);
    plot(f,P1(:,i))
end

subP1 = P1(2:55, :);