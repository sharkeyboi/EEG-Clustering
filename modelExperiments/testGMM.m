%% Test GMM
%Start with pxx(401,5138)

%Run PCA
[coeff,pcascore,latent,tsquared,explained]= pca(pxx');

%Add random noise to the data, where the amplitude of the noise depends on
%the range of that principle component

ranges = max(pcascore,[],1) - min(pcascore,[],1);
noisypcascore = pcascore + (rand(size(pcascore,1),size(pcascore,2))- 0.5) .* (0.2 * repmat(ranges,size(pcascore,1),1));
[idx1,P1,BIC1] = GMMCluster(pcascore(:,1:10),3,0);

noisypcascore = pcascore + (rand(size(pcascore,1),size(pcascore,2))- 0.5) .* (0.2 * repmat(ranges,size(pcascore,1),1));
[idx2,P2,BIC2] = GMMCluster(pcascore(:,1:10),3,0);
finalscore = bincomparison(idx1,idx2,3);

%% BIC Comparison
%How BIC Compares
testBIC = [];
for itr = 1:40
    disp(itr);
    [idx1,P1,BIC1] = GMMCluster(pcascore(:,1:itr),4,0);
    testBIC(itr) = BIC1;
end
plot(testBIC);

%% Hungarian Algorithm Comparison
testScore = [];
numbins = 3;
for itr = 1:20
    disp(itr);
    testScore = [];
    for jtr = 1:10
        [idx1,P1,BIC1] = GMMCluster(pcascore(:,1:itr),numbins,0);
        [idx2,P2,BIC2] = GMMCluster(pcascore(:,1:itr),numbins,0);
        testScore(jtr) = bincomparison(idx1,idx2,numbins);
    end
    meanscores(itr) = mean(testScore);
end
plot(meanscores);