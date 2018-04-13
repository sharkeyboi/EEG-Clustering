function [newpxx] = RemoveNoise(pxx, range)
%Remove ventilation and heartbeat noise
newpxx = pxx;
newpxx(:,range)=0;

end