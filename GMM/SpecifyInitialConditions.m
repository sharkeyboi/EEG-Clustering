Mu = [-75 0; 0 -50; 0 -100; 50 -50; -10 25; -5 50; 75 25; 25 60; -10 75];
for itr = 1:9
    Sigma(:,:,itr) = eye(2);
end
PComponents = ones(1,9) / 9;
S = struct('mu',Mu,'Sigma',Sigma,'ComponentProportion',PComponents);

gm = fitgmdist(Y, 9, 'RegularizationValue', 0, 'Start', S,'Replicates', 1, 'Options', statset('MaxIter', 1000, 'TolFun', 1e-6));