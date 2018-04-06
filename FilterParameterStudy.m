function [] = FilterParameterStudy(dataset, sigmaRange, SzRange)
    Fs = 1000;
    for index = sigmaRange
        for index2 = SzRange
            [pxx,f] = periodogram(dataset,hann(length(dataset)),length(dataset),Fs);

            sigma = index;
            sz = index2;    % length of gaussFilter vector
            x = linspace(-sz / 2, sz / 2, sz);
            gaussFilter = exp(-x .^ 2 / (2 * sigma ^ 2));
            gaussFilter = gaussFilter / sum (gaussFilter);
            pxx = filter(gaussFilter,1,pxx,[],2);
            
            idx = GMMCluster(pxx',2,0.001);
            numbins = 2;
            clusteredwaves = NewClustering(idx,numbins,dataset);
            totallength = size(dataset,1) * size(dataset,2);
            waves = reshape(dataset, [totallength, 1]);
            plotclusters(waves,2,clusteredwaves);
            figure;
            saveas(gcf,strcat('FilterParameterStudy\','Sigma-',num2str(index),'Sz-',num2str(index2),'GMMCluster.fig'));
        end
        
    end
    
end