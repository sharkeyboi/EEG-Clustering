function [subP1, f] = transformdatanf(data, numsnippets)
Fs = 1000;
L = length(data);


fftdata = fft(data);


P2 = abs(fftdata/L);
P1 = P2(1:L/2+1,:);
P1(2:end-1) = 2*P1(2:end-1);

f = Fs*(0:(L/2))/L;

fMax = min(size(P1,1), numsnippets);
fMax = min(fMax,750);

f = f(2:fMax);

subP1 = P1(2:fMax, :);
% figure;
% for i = 1:9
%     subplot(3,3,i);
%     plot(f,subP1(:,i))
% end

subP1 = subP1';
end