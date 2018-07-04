function [] = RecreateKmeans(IDX,numbins,pxx,D, clusters, freq, Y,folder, number)
datalength = length(clusters);
Z = linkage(D');
cmap = colormap('jet');
interval = floor(64/numbins);
C = cmap(64:-interval:1,:);

currentfig = figure('units','normalized','outerposition',[0 0 1 1])
subplot(2,2,1);
[H, T,outPerm] = dendrogram(Z);
meanpxx = [];
for itr = 1:numbins
meanpxx(:,itr) = mean(pxx(:,find(IDX==itr)),2);
end

subplot(2,2,2);
tsnedata(IDX,numbins,Y);

for i = 1:numbins
    subplot(4,numbins,numbins*2+i)
%     plot(freaks(1:maxBin),mean(Iblur(:,find(IDX==outPerm(i))),2));
    plot(freq,meanpxx(:,outPerm(i)),'Color',C(outPerm(i),:));
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
%     set(gca,'XTick',0:100:400)
%     set(gca,'XTicklabels',[])
    grid on
end
subplot(4,1,4);
for itr = 1:numbins
    plot(1:datalength, clusters(:,:,itr),'Color',C(itr,:));
    
    %Set the axis limits to be the min and max of the data
    axis([0 inf min(min(clusters)) max(max(clusters))]);
    hold on;
end
drawnow
% plot(ones(1,length(waves))*0.5);
% hold on;
% plot(ones(1,length(waves))*0.7);
% hold on;
% plot(ones(1,length(waves))*0.8);
% hold on;
saveas(currentfig,strcat(folder,num2str(number),'.png'));
end