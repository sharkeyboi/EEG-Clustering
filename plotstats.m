counter = 1;
for itr = 1:9
        subplot(3,3, counter);
        plot(statistics(counter,:));
        counter = counter + 1;
end

