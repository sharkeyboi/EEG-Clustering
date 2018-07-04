function [] = plotclusters(clusteredWave, wave)
figure;
cmap = colormap('jet');
interval = floor(64/size(clusteredWave,3));
C = cmap(64:-interval:1,:);
subaxis(size(clusteredWave,3)+1,1,1, 'SpacingVert', 0);


% Plots first wave
plot(1:length(clusteredWave), wave);
ylabel('Wave');

set(gca,'xtick',[])
set(gca,'xticklabel',[])
set(gca,'YTickLabel',[]);
% axis([0 inf -2 2]);

% Plots the 'sub-waves'
for i=2:size(clusteredWave,3)+1

    subaxis(size(clusteredWave,3)+1,1,i, 'SpacingVert', 0);
    plot(1:length(clusteredWave), clusteredWave(:,:,i-1),'Color',C(i-1,:));
%     axis([0 inf -2 2]);
    ylabel(i-1);
    if i < size(clusteredWave,3)+1
        set(gca,'xtick',[])
        set(gca,'xticklabel',[])
    end
    set(gca,'YTickLabel',[]);
    
end
