function C = runspectral(pxx,k)
    normpxx = normalizeData(pxx);
    W = SimGraph_NearestNeighbors(normpxx,15,1,1);
    C = SpectralClustering(W,k,2);
end