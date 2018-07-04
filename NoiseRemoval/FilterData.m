function [data] = FilterData(data,cutoff)



%Remove snippets that are above the cutoff threshold
data(:,max(abs(data))>cutoff) = [];

%%Center the data around zero
%data = data-repmat(mean(data,2),[1 size(data,2)]);

%Downsampled the data by a factor of 10x.
data = data(1:10:end,:);

%Normalize the data
%data = data / max(max(abs(data)));
end