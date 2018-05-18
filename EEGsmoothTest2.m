blurSize = 55;
numbins = 7;

nClust = numbins%11;
% maxBin = 700;
Fs = 1000;

Iblur = [];
IDX = [];
%% alternate to the code in transformdata
% [pxx,freq] = periodogram(allData(:,i),hann(10000),[],Fs);
% for i = 1:size(allData,2);
%     allSPEC(:,i) = periodogram(allData(:,i),hann(10000),[],Fs);
% end
% allSPEC = log(allSPEC);

% min(find(freq>55))

% Iblur = imgaussfilt(allSPEC(1:maxBin,:), blurSize);

% Iblur = medfilt2(allSPEC(1:maxBin,:),[1 blurSize]);
Iblur = medfilt2(log(pxx),[11 blurSize]);



%% Optional: amplify differences, by subtracting the mean spectrum
Iblur = Iblur-repmat(mean(Iblur,2),[1 size(Iblur,2)]);

%% Optional: zscore (whiten) the spectra
Iblur = zscore(Iblur,[],1);


%% Do k-means
[IDX, C, SUMD, D] = kmeans(Iblur', nClust);

%% Re-arrange the arbitrary cluster numbers according to the STD of the data (higher-amplitude sync states should have higher STD than desync)
sd = std(data,1);
% sd2 = max(abs(data),[],1);

clustSD = [];
for i = 1:numbins;clustSD(i) = mean(sd(IDX==i));end
[a,b] = sort(clustSD);
D = D(:,b);
C = C(b,:);
SUMD = SUMD(b);
IDX2 = zeros(size(IDX));
for i = 1:numbins;
    IDX2(IDX==b(i)) = i;
end
IDX = IDX2;clear IDX2


%% Do the hierarchical bit
Z = linkage(D');


figure
subplot(2,1,1)
[H, T,outPerm] = dendrogram(Z);

ylims = [];
for i = 1:nClust
    subplot(4,nClust,nClust*2+i)
%     plot(freaks(1:maxBin),mean(Iblur(:,find(IDX==outPerm(i))),2));
    plot(freaks(1:maxBin),C(outPerm(i),:));
    axis tight;%ylim([-2 6]);axis square;axis off;
    ylims(i,:) = get(gca,'YLim');
    hold on
    line([0 maxFreak],[0 0])
    title(num2str(length(find(IDX==outPerm(i)))))
end
YLIMS(1) = min(ylims(:,1));
YLIMS(2) = max(ylims(:,2));

for i = 1:nClust
    subplot(4,nClust,nClust*2+i)
    axis tight
    ylim(YLIMS)
    set(gca,'XTick',0:10:40,'YTick',[])
    set(gca,'XTicklabels',[],'YTicklabels',[])
    grid on
end

%% Show the sorted spectra
figure
[a,b] = sort(IDX);
imagesc(scale_clip(Iblur(:,b),.5))
hold on
ind = 0;
for i = 1:nClust
    nSnips = length(find(IDX==i));
    ind = ind+nSnips;
    h = line([ind ind],[1 size(Iblur,1)]);
    set(h,'linewidth',1,'color','k')
end

%% show the aligned traces, spectra and clusters
figure

subplot(3,1,1)
plot(waves(:))
axis tight

subplot(3,1,2)
imagesc(scale_clip(Iblur,.5))
hold on
transPTs = find(abs(diff(IDX)));
for i = 1:length(transPTs)
    h = line([transPTs(i) transPTs(i)],[0 900]);
    set(h,'linewidth',1,'color','k')
end

subplot(3,1,3)
plot(IDX)
axis tight
ylim([0 nClust+1])


%% Show the average spectra
figure
for i = 1:nClust
    
plot(freaks(1:maxBin),mean(Iblur(:,find(IDX==i)),2))
hold on
end

%% Check the distance metric
figure
for j = 1:nClust;for i = 1:nClust;subplot(nClust,nClust,(i-1)*nClust+j);plot(freaks(1:maxBin),mean(Iblur(:,find(IDX==i)),2));hold on;plot(freaks(1:maxBin),mean(Iblur(:,find(IDX==j)),2));end;end
figure
for j = 1:nClust;for i = 1:nClust;subplot(nClust,nClust,(i-1)*nClust+j);histogram(D(find(IDX==i),j),0:50:2000);end;end





