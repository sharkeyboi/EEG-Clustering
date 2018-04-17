normalizedPxx = pxx;
for itr = 1:1000
    normalizedPxx(itr,:) = normalizedPxx(itr,:) / max(normalizedPxx(itr,:));
end