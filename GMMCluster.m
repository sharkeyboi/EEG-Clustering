function [idx] = GMMCluster(dataset, k, regval)

gm = fitgmdist(dataset, k, 'RegularizationValue', regval);
idx = cluster(gm, dataset);

% figure;
%  subplot(2,1,1);
% samps = (subset*10000):((subset*10000)+totallength - 1);
% plot(samps, waves);
% 
% subplot(2,1,2);
% plot(1:length(idx), idx);
end
