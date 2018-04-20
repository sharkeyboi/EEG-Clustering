for itr=1:7
   temp = Iblur(:,find(idx==itr));
   means(:,itr) =  mean(temp,2);
end
for itr=1:7
    for jtr=1:7
        distances(itr,jtr) = norm(means(:,itr) - means(:,jtr));
    end
end
distances = distances * -1;
solved = munkres(distances);

for itr=1:7
   temp2 = Iblur(:,find(kidx==itr));
   means2(:,itr) =  mean(temp2,2);
end
for itr=1:7
    for jtr=1:7
        distances2(itr,jtr) = norm(means2(:,itr) - means2(:,jtr));
    end
end
distances2 = distances2 * -1;
solved2 = munkres(distances2);