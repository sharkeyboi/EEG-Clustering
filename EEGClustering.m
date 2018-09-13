
%% Identify Clusters in EEG signals using Spectral Clustering

% Input:
%
%   data: EEG Signals in the form (M x N), where M is the number of samples in each signal, and N is the number of signals.
%   temporal: Determines weight of temporal column. If data is not in
%   temporal order, select 0.
%   Fs: Sample Rate of the signals
%   k: Number of Clusters
%   plot: Indicates whether or not a plot of the clustered signals should
%   be generated and displayed.
%
% Output:
%
%   idx: Vector of cluster assignments for each signal.
%
    
function [idx] = EEGClustering(data, temporal, Fs, k, plot)
    
    % Convert the signals to the frequency domain using FFT
    pxx = transformdata(data, Fs);
    if temporal
        plen = length(pxx);
        time = (1:plen)/plen*((max(max(pxx))-min(min(pxx)))) * temporal;
        time = time - mean(time);
        pxx = [time;pxx];
    end
    idx = runspectral(pxx,k);
    
    if plot
        plotclusters(idx,data,ones(length(data),2));
    end
end
