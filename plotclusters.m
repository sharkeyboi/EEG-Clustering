function [] = plotclusters(totalwave,numBins, clusteredWave)
figure;
subaxis(8,1,1, 'SpacingVert', 0);

plot(1:length(totalwave), totalwave);
ylabel('Wave');

set(gca,'xtick',[])
set(gca,'xticklabel',[])
set(gca,'YTickLabel',[]);
ylim([-1 1]);

for i=2:numBins+1

    subaxis(8,1,i, 'SpacingVert', 0);
    plot(1:length(totalwave), clusteredWave(:,:,i-1));
    ylabel(i-1);
    if i < numBins+1
        set(gca,'xtick',[])
        set(gca,'xticklabel',[])
    end
    set(gca,'YTickLabel',[]);
    ylim([-1 1]);
end
