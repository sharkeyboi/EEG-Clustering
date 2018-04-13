% Create test data
MU = [-2 2];
MU2 = [2 -2];
SIGMA = [0.5 0;0 0.5];
SIGMA2 = [0.5 0; 0 0.5];
R1 = mvnrnd(MU,SIGMA, 1000);
R2 = mvnrnd(MU2,SIGMA2, 1000);

MU3 = [-2.5 2.5];
SIGMA3 = [0.002 0; 0 0.002];
R3 = mvnrnd(MU3, SIGMA3,1000);

testdata = [R1; R2; R3];

scatter(testdata(:,1), testdata(:,2));

figure;

% Compute hierarchical clusters and plot
Y = pdist(testdata);
Z = linkage(Y, 'complete');
testidx = cluster(Z,'maxclust',3);

testidx = GMMCluster(testdata,3,0.001);

plot(testdata(testidx==1,1),testdata(testidx==1,2),'r.','MarkerSize',12);
hold on;
plot(testdata(testidx==2,1),testdata(testidx==2,2),'b.','MarkerSize',12);

plot(testdata(testidx==3,1),testdata(testidx==3,2),'g.','MarkerSize',12);

dendrogram(Z);