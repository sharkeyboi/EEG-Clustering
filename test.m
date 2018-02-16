figure;
x = linspace(0,10,1000);
y = sin(10*x).*exp(.5*x);
ax1 = subplot(2,1,1);
plot(x,y)
ylim(ax1, [-100, 100]);

ax2 = subplot(2,1,2);
plot(x,y)
ylim(ax2,[-10 10])