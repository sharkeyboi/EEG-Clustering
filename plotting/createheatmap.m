function [] = createheatmap(waves,numbins,clusters, P)
    imageP = 0;
    C = {'k','b','r','g','y','c','m'};
    subaxis(2,1,1, 'SpacingVert', 0);
    for itr = 1:numbins
        plot(1:length(waves), clusters(:,:,itr),'Color',C{itr});
        hold on;
    end

    ylabel('Wave');

    set(gca,'xtick',[])
    set(gca,'xticklabel',[])
    set(gca,'YTickLabel',[]);
    axis([0 inf -2 2]);
    subaxis(2,1,2, 'SpacingVert', 0);
    imageP = P';
    imageP = repelem(imageP,100,1);
    imshow(imageP, 'InitialMagnification','fit')
end