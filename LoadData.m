cd datafolder
FileList = dir('*.mat');
name = {FileList.name}.';
maxSamples = 5207;

numsnippets = input('How many samples? (Must be greater than 5001)\n');
numbins = input('How many bins?\n');


bound = length(name) - numsnippets + 1;
subset = randi(bound,1,1);

i = 1;
clear data;

data = zeros(10000, maxSamples);

for k = 1:maxSamples
   data(:,k) = importdata(name{k}); 
end

cd ..

newNumSamples = numsnippets;
for i = (subset+numsnippets-1):-1:subset
    if max(abs(data(:,i))) >= 1.4
        data(:,i) = [];
        newNumSamples = newNumSamples - 1;
    end
end
numsnippets = newNumSamples;
data = data(:,subset:(subset+numsnippets-1));
max(max(abs(data)))


%Resize data matrix to match numsamples


%Resize the number of samples and create flattened sample array
totallength = size(data,1) * size(data,2);

waves = reshape(data, [totallength, 1]);