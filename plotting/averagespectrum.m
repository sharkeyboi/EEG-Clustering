avgpxx = mean(pxx,2);
figure;
pxxt = pxx';

stdshade(10*log10(pxxt(:,100:1000)),0.1,'g',f(100:1000));

xlabel('Frequency (Hz)'), ylabel('Power');

title('Average Spectrum');
h = findobj(gca,'Type','line');
legend(h,'Desync','Sync');