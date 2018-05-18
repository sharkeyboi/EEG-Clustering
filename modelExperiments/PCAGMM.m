totallength = size(data,1) * size(data,2);

waves = reshape(data, [totallength, 1]);


[coeff,pcascore,latent,tsquared,explained]= pca(pxx');
ranges = max(pcascore,[],1) - min(pcascore,[],1);
noisypcascore = pcascore + (rand(size(pcascore,1),size(pcascore,2))- 0.5) .* (0.2 * repmat(ranges,size(pcascore,1),1));
[idx1,P1,BIC1] = GMMCluster(pcascore(:,1:40),3,0.001);

noisypcascore = pcascore + (rand(size(pcascore,1),size(pcascore,2))- 0.5) .* (0.2 * repmat(ranges,size(pcascore,1),1));
[idx2,P2,BIC2] = GMMCluster(pcascore(:,1:40),3,0.001);
finalscore = bincomparison(idx1,idx2,3);