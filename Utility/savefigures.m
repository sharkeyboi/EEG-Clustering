for itr = 1:220
    f = figure('visible','off');
    scatter(tsneoutput(:,1,itr),tsneoutput(:,2,itr),10);
    saveas(f,strcat('tsneplots/',num2str(itr)),'png')
end