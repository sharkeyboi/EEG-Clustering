function [noiseidx] = autonoise2(data)
thresh = 0.24;
noiseidx = [];
for itr = 1:size(data,2);
    s = data(:,itr);
    mu = mean(s);
    minidx = find(s==min(s));
    minidx = minidx(1);
    maxidx = find(s==max(s));
    maxidx = maxidx(1);
    if(abs(s(maxidx)) < abs(s(minidx)))
        maxidx = minidx;
    end
        currsigma = s(maxidx)-mu;
        if(abs(currsigma)>thresh)
            disp('Noise found at idx:');
            disp(itr);
            noiseidx = [noiseidx itr];
        end
            
        end
        
end