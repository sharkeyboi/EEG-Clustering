function [] = createheatmap(clusters, P)
    figure('units','normalized','outerposition',[0 0 1 1])
    imageP = 0;
    cmap = colormap('jet');
    interval = floor(64/size(clusters,3));
    C = cmap(64:-interval:1,:);
    subaxis(2,1,1, 'SpacingVert', 0);
    for itr = 1:size(clusters,3)
        plot(1:length(clusters), clusters(:,:,itr),'Color',C(itr,:));
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