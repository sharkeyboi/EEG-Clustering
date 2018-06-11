likelihood = [];
for itr = 1:300
    [~,~,~,gm] = GMMCluster(pcascore(:,1:itr),6,0,10);
    likelihood(itr) = gm.NegativeLogLikelihood;
end

plot(likelihood);