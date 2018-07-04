current = [];
alldata = {};
for itr = 1:13
    current = LoadData(num2str(itr));
    alldata{itr} = current;
end
save('alldata.mat',alldata);
