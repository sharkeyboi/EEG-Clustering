%gm = fitgmdist(pxx', 7, 'RegularizationValue', 0.0001);
%kidx = kmeans(pxx',7);
kclusters = {};
for itr = 1:7
    kclusters{itr} = pxx(:,kidx==itr);
end


for itr = 1:7
    gidx = cluster(gm,kclusters{itr}');
    for jtr = 1:7
        count(itr,jtr) = sum(gidx(gidx==jtr))/jtr;
    end
end
count = count * -1;
indices = munkres(count);