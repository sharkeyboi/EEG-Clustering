function [idx] = noiseidentification(testdata)
idx = find(max(abs(testdata)) >= 0.23);
end

    