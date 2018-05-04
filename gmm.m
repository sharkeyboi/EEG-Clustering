%Generate normally distributed data
rng('default');
mu = [3 3];
mu2 = [2 2];
mu3 = [2 2];
sigma = [0.6 0.4;0.4 0.5];
sigma2 = [0.5 0.2;0.2 0.5];
sigma3 = [0.5 0.2;0.2 0.5];
R1 = mvnrnd(mu,sigma, 25);
R2 = mvnrnd(mu2,sigma2, 25);
R3 = mvnrnd(mu3,sigma3, 25);

data = [R1; R2; R3];

gm = fitgmdist(data,2)

% List of rgb colors for every data point.
myColors = zeros(size(data, 1), 3); 

for i=1:50
    if i<26
        myColors(i, :) = [0,0,1];
    else
        myColors(i, :) = [1,0,0];
    end
end

p=posterior(gm,data);

scatter(data(:,1), data(:,2), 10, myColors);
hold on
ezcontour(@(x,y)pdf(gm,[x y]),[-6 6],[-6 6])