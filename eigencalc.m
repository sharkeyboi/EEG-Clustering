% %Reduce subP1 into a square matrix
% 
% numtosquare = size(subP1,1) - size(subP1,2);
% 
% subP1 = subP1(numtosquare+1:end,:);
% 
% 
% covariance = cov(subP1);
% 
% disp('Covariance');
%     [V,D] = eig(covariance);
%     
 values = sum(D);
 values = sort(values,'descend');
 cs = cumsum(values);
 
 total = sum(values);
 elbow = cs/total;
 
 plot(elbow(1:100));
 xlabel('Principle Components');
 ylabel('Variance');