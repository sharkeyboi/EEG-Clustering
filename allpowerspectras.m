trainpxx = [];
for itr = 1:13
    currData = alldata{itr};
    currData = FilterData(currData,1000);
    currPxx = transformdata(currData,2,5);
    trainpxx = [trainpxx currPxx];
end