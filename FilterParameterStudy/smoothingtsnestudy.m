tsneoutput = [];
error = [];
counter = 1;
for itr = 3:2:21
		[pxx, freq, pcascore, explained] = transformdataGauss(downsampled, itr);
		[tsneoutput(:,:,counter), error(counter)] = tsne(pxx');
		counter = counter + 1;
end