function [] = RecreateKmeans(IDX,numbins,Iblur,D, waves, clusters)
Z = linkage(D');
C = {'k','b','r','g','y','c','m'};

figure('units','normalized','outerposition',[0 0 1 1])
subplot(2,1,1);
[H, T,outPerm] = dendrogram(Z);
meanpxx = [];
for itr = 1:numbins
meanpxx(:,itr) = mean(Iblur(:,find(IDX==itr)),2);
end

for i = 1:numbins
    subplot(4,numbins,numbins*2+i)
%     plot(freaks(1:maxBin),mean(Iblur(:,find(IDX==outPerm(i))),2));
    plot(meanpxx(:,outPerm(i)),'Color',C{outPerm(i)});
    axis tight;%ylim([-2 6]);axis square;axis off;
    ylims(i,:) = get(gca,'YLim');
    hold on
    title(num2str(length(find(IDX==outPerm(i)))))
end
YLIMS(1) = min(ylims(:,1));
YLIMS(2) = max(ylims(:,2));
for i = 1:numbins
    subplot(4,numbins,numbins*2+i)
    axis tight
    ylim(YLIMS)
    set(gca,'XTick',0:100:400,'YTick',[])
    set(gca,'XTicklabels',[],'YTicklabels',[])
    grid on
end
subplot(4,1,4);
for itr = 1:numbins
    plot(1:length(waves), clusters(:,:,itr),'Color',C{itr});
    axis([0 inf -2 2]);
    hold on;
end

end