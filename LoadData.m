%Creates a list of mat files within the datafolder directory
cd datafolder
FileList = dir('*.mat');
name = {FileList.name}.';
maxSamples = 5207;

%If the number of snippets isn't defined, use the whole dataset
if exist('numsnippets','var') == 0
    numsnippets = maxSamples;
end

%Creates an index for the snippets for any number of snippets selected
bound = length(name) - numsnippets + 1;
subset = randi(bound,1,1);

clear data;

data = zeros(10000, maxSamples);
%Imports the data from the mat files into a data matrix
for k = 1:maxSamples
   data(:,k) = importdata(name{k}); 
end

cd ..

%Removes snippets where the max amplitude is greater than 1.4
newNumSamples = numsnippets;
for index = (subset+numsnippets-1):-1:subset
    if max(abs(data(:,index))) >= 1.4
        data(:,index) = [];
        newNumSamples = newNumSamples - 1;
    end
end
numsnippets = newNumSamples;
data = data(:,subset:(subset+numsnippets-1));

%Verify the maximum of the data after denoising
max(max(abs(data)))
fs= 1000;
%Remove the Line Noise from the data. TODO: Parameter study
denoisedData = RemoveLineNoise(data',fs,'LF = 60,NH = 8');
denoisedData = denoisedData';

%Line Noise Removal introduces NaN column at 5137 and imaginary numbers.
data = real(denoisedData);
data = [data(:,1:5136) data(:,5138:end)];
numsnippets = 5138;
%Resize the number of samples and create flattened sample array
totallength = size(data,1) * size(data,2);

waves = reshape(data, [totallength, 1]);

