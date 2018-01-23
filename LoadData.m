cd datafolder
FileList = dir('*.mat');
name = {FileList.name}.';

numsamples = input('How many samples?');

bound = length(name) - numsamples;
subset = randi(bound,1,1);

i = 1;
clear data;

for k = subset: (subset + numsamples - 1)
    data(:,i) = importdata(name{k});
    i = i + 1;
end

cd ..