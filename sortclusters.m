stds = [];
for itr=1:7
   temp = data(:,find(idx==itr));
   stds(:,itr) =  std(temp,0,2);
end
for itr=1:7
    for jtr=1:7
        distances(itr,jtr) = norm(stds(:,itr) - stds(:,jtr));
    end
end
distances = distances * -1;
solved = munkres(distances);

stds2 = [];

for itr=1:7
   temp2 = data(:,find(kidx==itr));
   stds2(:,itr) =  std(temp2,0,2);
end
for itr=1:7
    for jtr=1:7
        distances2(itr,jtr) = norm(stds2(:,itr) - stds2(:,jtr));
    end
end
distances2 = distances2 * -1;
solved2 = munkres(distances2);