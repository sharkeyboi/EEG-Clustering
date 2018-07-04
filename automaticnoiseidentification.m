function [noiseidx] = automaticnoiseidentification(data)
thresh = 0.3;
noiseidx = [];
mui = 0;
for itr = 1:size(data,2);
    s = data(:,itr);
    currentPoint = (itr-1)*1000;
    for jtr = 1:1000
        currsigma = s(jtr)-mui;
        mui = (currentPoint + jtr-1) * mui / (currentPoint + jtr) + s(jtr)/(currentPoint + jtr);
        if(jtr>2)
            if(abs(currsigma) > thresh)
            disp('Noise found at idx:');
            disp(itr);
            disp('Sample:');
            disp(jtr);
            noiseidx = [noiseidx itr];
            break;
            end
            
            
        end
        
    end
end
end