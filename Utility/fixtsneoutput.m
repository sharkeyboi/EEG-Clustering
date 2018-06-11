temp = ones(5138,2,4,19);
newtsneoutput = tsneoutput;
for i = 0:3
    for j = 1:19
        temp(:,:,i+1,j) = newtsneoutput(:,:,i+1,19*i + j);
    end
end