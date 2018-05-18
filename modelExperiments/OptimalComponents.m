function [ n,var ] = OptimalComponents( pxx, varargin )
%OPTIMALCOMPONENTS Summary of this function goes here
%   Detailed explanation goes here
disp(varargin);
disp(nargin);
params = {0.85, 40};
if(~isempty(varargin))
    params(1:nargin-1) = varargin;
end;
epsillon = params{1};
tol = params{2};

covariance = cov(pxx');

[V,D] = eig(covariance);
values = sum(D);
values = sort(values,'descend');
total = sum(values);
var = 0;
n = 0;
for itr = 1:tol
    
    currentSum = sum(values(1:itr));
    var = currentSum / total;
    if (var >= epsillon)
        break;
    end;
end
n = itr;
end

