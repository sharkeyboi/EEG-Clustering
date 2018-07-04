function [sigmais] = meannoise(noisedata)
sigmais = [];
    for itr = 1:size(noisedata,2);
        s = noisedata(:,itr);
        mu = mean(s);
        %Find the index of the max amplitude of signal s
        minidx = find(s==min(s));
        minidx = minidx(1);
        maxidx = find(s==max(s));
        maxidx = maxidx(1);
        if(abs(s(maxidx)) < abs(s(minidx)))
            maxidx = minidx;
        end
        sigmais = [sigmais s(maxidx)-mu];
    end

end