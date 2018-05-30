tsneoutput = [];
error = [];
counter = 1;
error1 = 1;
error2 = 1;
for itr = 0.1:0.1:2
	for jtr = 1:0.1:2
		[pxx, freq, pcascore, explained] = transformdata(data, [jtr, itr]);
		[tsneoutput(:,:,counter), error(error1, error2)] = tsne(pxx');
		counter = counter + 1;
        error2 = error2 + 1;
    end
    error1 = error1 + 1;
end
