function [data] = FilterData(data, cutoff)
%%Center the data around zero
data = data-repmat(mean(data,2),[1 size(data,2)]);

%Remove snippets that are above the cutoff threshold
data(:,max(abs(data))>cutoff) = [];

%Downsampled the data by a factor of 10x.
data = data(1:10:end,:);
end