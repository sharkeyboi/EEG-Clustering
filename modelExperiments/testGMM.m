%% Test GMM
%Start with pxx(401,5138)

%Run PCA
%[coeff,pcascore,latent,tsquared,explained]= pca(pxx');
[pc,net]=nlpca(pxx', 1,  'type','inverse',  'circular','yes' );

   % plot components
   nlpca_plot(net)
   pc = nlpca_get_components(net, pxx(1:20,1:80)');
    pcascore = nlpca_get_data(net, pc);
disp('hi');
%Add random noise to the data, where the amplitude of the noise depends on
%the range of that principle component

ranges = max(pcascore,[],1) - min(pcascore,[],1);
noisypcascore = pcascore + (rand(size(pcascore,1),size(pcascore,2))- 0.5) .* (0.2 * repmat(ranges,size(pcascore,1),1));
[idx1,P1,BIC1] = GMMCluster(pcascore,3,0.001);

noisypcascore = pcascore + (rand(size(pcascore,1),size(pcascore,2))- 0.5) .* (0.2 * repmat(ranges,size(pcascore,1),1));
[idx2,P2,BIC2] = GMMCluster(pcascore,3,0.001);
finalscore = bincomparison(idx1,idx2,3);

%% BIC Comparison
%How BIC Compares
testBIC = [];
for itr = 1:20
    disp(itr);
    [idx1,P1,BIC1] = GMMCluster(pcascore(:,1:itr),4,0.001);
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
        [idx1,P1,BIC1] = GMMCluster(pcascore(:,1:itr),numbins,0.001);
        [idx2,P2,BIC2] = GMMCluster(pcascore(:,1:itr),numbins,0.001);
        testScore(jtr) = bincomparison(idx1,idx2,numbins);
    end
    meanscores(itr) = mean(testScore);
end
plot(meanscores);