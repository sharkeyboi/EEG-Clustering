s = fulldata2(:,1);
    mui = 0;
    for jtr = 1:1000
        currsigma = s(jtr)-mui
        if(jtr>10)
            if(abs(currsigma) > thresh)
            disp('Noise found at idx:');
            disp(itr);
            disp('Sample:');
            disp(jtr);
            noiseidx = [noiseidx itr];
            break;
            end
            mui = (jtr-1) * mui / jtr + s(jtr)/jtr;
            
        end
        
    end