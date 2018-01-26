figure;
subaxis(8,1,1, 'SpacingVert', 0);
plot(1:totallength, waves);
ylabel('Wave');

set(gca,'xtick',[])
set(gca,'xticklabel',[])
set(gca,'YTickLabel',[]);

for i=2:numbins+1

    subaxis(8,1,i, 'SpacingVert', 0);
    plot(1:totallength, clusteredwaves(:,:,i-1));
    ylabel(i-1);
    if i < numbins+1
        set(gca,'xtick',[])
        set(gca,'xticklabel',[])
    end
    set(gca,'YTickLabel',[]);
end
