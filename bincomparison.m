function [score] = bincomparison(idx1, idx2, numbins)
cost = zeros(numbins, numbins);
for i = 1:numbins
    indices = find(idx1 == i);
    test = idx2(indices);
    for j = 1:numbins
        cost(i,j) = length(test(test == j));
    end
end
cost = cost * -1;

solved = munkres(cost);

cost = cost * -1;

costnumber = 0;

for i = 1:numbins
    costnumber = costnumber + cost(i, solved(i));
end

score = costnumber / length(idx1);

end