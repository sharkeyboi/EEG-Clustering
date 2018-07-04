function [data] = LoadData(foldername)
%Creates a list of mat files within the datafolder directory

cd(foldername);
FileList = dir('*.mat');
name = {FileList.name}.';
numsnippets = length(FileList);


% %Creates an index for the snippets for any number of snippets selected
% bound = length(name) - numsnippets + 1;
% subset = randi(bound,1,1);

data = zeros(10000, numsnippets);
%Imports the data from the mat files into a data matrix
for k = 1:numsnippets
   currentsnippet = importdata(name{k});
   data(:,k) = currentsnippet(:,1);
end

cd ..
%data = data(1:10:end,:);
%Removes snippets where the max amplitude is greater than 1.4
% newNumSamples = numsnippets;
% for index = (subset+numsnippets-1):-1:subset
%     if max(abs(data(:,index))) >= 1.4
%         data(:,index) = [];
%         newNumSamples = newNumSamples - 1;
%     end
% end
% numsnippets = newNumSamples;
% data = data(:,subset:(subset+numsnippets-1));

fs= 1000;
% Remove the Line Noise from the data. TODO: Parameter study
data = RemoveLineNoise(data',fs,'LF = 60,NH = 8');
data = data';

%Line Noise Removal introduces NaN column at 5137 and imaginary numbers.
data = real(data);
% data = [data(:,1:5136) data(:,5138:end)];
% numsnippets = 5138;
%Resize the number of samples and create flattened splotclusters(ample array
% totallength = size(data,1) * size(data,2);
% 
% waves = reshape(data, [totallength, 1]);
data = data(:,max(isnan(data)) == 0);
end