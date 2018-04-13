% %Reduce subP1 into a square matrix

numtosquare = size(subP1,1) - size(subP1,2);

subP1 = subP1(numtosquare+1:end,:);

% Calculate covariance matrix
covariance = cov(subP1);

   % Calculate eigenvalues
disp('Covariance');
    [V,D] = eig(covariance);
    
% Gets column vector of eigenvalues
 values = sum(D);
 values = sort(values,'descend');
 cs = cumsum(values);
 
 total = sum(values);
 elbow = cs/total;
 
 % Plots number of components compared to variance explained
 plot(elbow(1:100));
 xlabel('Principle Components');
 ylabel('Variance');