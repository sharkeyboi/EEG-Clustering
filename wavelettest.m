XN = data(:,1);

xdMODWT = wden(XN,'modwtsqtwolog','s','mln',4,'sym4');
figure;
plot(XN,'r')
hold on;
plot(xdMODWT)
legend('Original Signal','Denoised Signal','Location','NorthEastOutside')
axis tight;
hold off;
