function [pxx, f, pcascore, explained, downsampled] = transformdataGauss(dataset, winSize)


%%%%%%%%%%%% Periodogram %%%%%%%%%%%%%
rng default
Fs = 100;
%dataset = hampel(dataset,5);

% Nfft = next largest power of 2 greater than length of dataset
%[pxx,f] = periodogram(dataset,hann(length(dataset)),length(dataset),Fs);

[pxx,f] = periodogram(dataset,hann(size(dataset,1)),size(dataset,1),Fs);
pxx = log(pxx);


alpha = (winSize - 1)/2;
window = gausswin(winSize, alpha);
window = window / sum(window);
pxx = filter(window,1,pxx');
pxx = pxx';
%Only keep frequencies through 100 Hz
%pxx = pxx(1:412,:);
%f = f(1:412);
%% Optional: amplify differences, by subtracting the mean spectrum
pxx = pxx-repmat(mean(pxx,2),[1 size(pxx,2)]);

%% Optional: zscore (whiten) the spectra
pxx = zscore(pxx,[],1);

[~,pcascore,~,~,explained] = pca(pxx');

% For calculating based on the bands
% delta = mean(pxx(find(f<4),:));
% theta = mean(pxx(find(f<=8 & f>=4),:));
% alpha = mean(pxx(find(f>=7.5 & f<=12.5),:));
% beta = mean(pxx(find(f>=13 & f<=30),:));
% lgamma = mean(pxx(find(f>=30 & f<=70),:));
% hgamma = mean(pxx(find(f>=70 & f<=150),:));
% bands = [delta; theta; alpha; beta; lgamma; hgamma];
% 
% bands = imgaussfilt(bands,smoothing);


%% Downsamples data to make plotting faster

downsampled = dataset(1:20:end,:);
end
