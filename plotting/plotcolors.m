function [] = plotcolors(numBins, clusteredWave, colors, totalwave)
figure;

% Plots the waveforms as separate
% lines on the same plot so the the selection is a different color
subaxis(numBins+1,1,1, 'SpacingVert', 0);
firstwave = totalwave;
firstwave(colors) = 0;
plot(firstwave);
secondwave = zeros(length(totalwave),1);
secondwave(colors) = totalwave(colors);
hold on;
plot(secondwave);

ylabel('Wave');

set(gca,'xtick',[])
set(gca,'xticklabel',[])
set(gca,'YTickLabel',[]);
axis([0 inf -2 2]);

% Plots the waves
for i=2:numBins+1

    subaxis(numBins+1,1,i, 'SpacingVert', 0);
    plot(1:length(clusteredWave), clusteredWave(:,:,i-1));
    axis([0 inf -2 2]);
    ylabel(i-1);
    if i < numBins+1
        set(gca,'xtick',[])
        set(gca,'xticklabel',[])
    end
    set(gca,'YTickLabel',[]);
    
end
