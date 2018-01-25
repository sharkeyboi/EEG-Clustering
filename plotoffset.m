range = max(waves) - min(waves) - 15
offset = idx * range;

offsetdata = data + repmat(offset',10000,1);


totallength = size(offsetdata,1) * size(offsetdata,2);

offsetwaves = reshape(offsetdata, [totallength, 1]);

plot(1:totallength, offsetwaves)