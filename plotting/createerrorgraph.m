
counter = 1
for itr = 1:10
        f = figure('visible','off');
        subplot(2,1,1);
        scatter(tsneoutput(:,1,itr),tsneoutput(:,2,itr),2, 'filled');
        subplot(2,1,2);
        errorsurf = plot(error);
        ylabel('Error');
        xlabel('Smoothing Amount');
        hold on;
        point = scatter(itr,error(itr), 10, 'r', 'filled');
        % Extract axes handles of all subplots from the figure

        axesHandles = findobj(get(f,'Children'), 'flat','Type','axes');

        % Set the axis property to square

        axis(axesHandles,'square')
        saveas(f,strcat('gaussiananimation2/',num2str(counter)),'png')
        counter = counter + 1;
        

end


