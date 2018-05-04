regparamrange = logspace(-8,+1,100);
counter = 1;
acc = zeros(1,10);
for itr = regparamrange
    idx = GMMCluster(data,2,itr);
    acc(counter) = bincomparison(idx,trueidx,2);
    counter = counter + 1;
end
figure;
semilogx(regparamrange, acc);