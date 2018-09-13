% %Reduce squarepxx into a square matrix

squarepxx = pxx';
% numtosquare = size(squarepxx,1) - size(squarepxx,2);
% 
% squarepxx = squarepxx(numtosquare+1:end,:);

% Calculate covariance matrix
covariance = cov(squarepxx);

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
 squarepxx = squarepxx';