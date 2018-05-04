function [score] = bincomparison(idx1, idx2, numbins)

% Compares 2 separate instances of having run any 
% clustering algorithm
cost = zeros(numbins, numbins);
for i = 1:numbins
    indices = find(idx1 == i);
    test = idx2(indices);
    % Set cost to length of test when it equals j
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