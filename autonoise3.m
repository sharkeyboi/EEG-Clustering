function [noiseidx] = autonoise3(data)
thresh = 0.2405;
noiseidx = [];
for itr = 1:size(data,2);
    s = data(:,itr);
    mui = 0;
    for jtr = 1:1000
        currsigma = s(jtr)-mui;
            if(abs(currsigma) > thresh)
                if(abs(s(jtr)) > 0.5)
                    disp('Noise found at idx:');
                    disp(itr);
                    disp('Sample:');
                    disp(jtr);
                    noiseidx = [noiseidx itr];
                    break;
                end
            
            end
            mui = (jtr-1) * mui / jtr + s(jtr)/jtr;
            
        end
        
    end
end
