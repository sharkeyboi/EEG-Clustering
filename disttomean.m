function [dist] = disttomean(mu,p)
mu = reshape(mu,7,40,1);
mu = repmat(mu,1,1,5138);
p = reshape(p,1,40,5138);
p = repmat(p,7,1,1);

dist = sqrt(sum((p-mu).^2,2));
dist = reshape(dist,5138,7);
end