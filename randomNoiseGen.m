newNoise = [];
b = noisesnippets(:,randi([1,3044],3044,1));
for itr = 1:3043
    s1 = b(:,itr);
    s2 = b(:,itr+1);
    newNoise = [newNoise mean([s1 s2],2)];
end