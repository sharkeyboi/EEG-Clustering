function [sigmais] = cummeannoise(noisedata)
sigmais = [];
    mui = 0;
    for itr = 1:size(noisedata,2);
        s = noisedata(:,itr);
        %Find the index of the max amplitude of signal s
        minidx = find(s==min(s));
        minidx = minidx(1);
        maxidx = find(s==max(s));
        maxidx = maxidx(1);
        if(abs(s(maxidx)) < abs(s(minidx)))
            maxidx = minidx;
        end
        %Calculate cumulative mean up to that point
        
        currentPoint = (itr-1)*1000;
        
        for jtr = 1:maxidx-1
            mui = (currentPoint + jtr-1) * mui / (currentPoint + jtr) + s(jtr)/(currentPoint +jtr);
        end

        sigmais = [sigmais s(maxidx)-mui];
        
        for jtr = maxidx:1000
            mui = (currentPoint + jtr-1) * mui / (currentPoint + jtr) + s(jtr)/(currentPoint +jtr);
        end
    end

end