% counter = 0;
% for itr = 1:20
%     for jtr = 1:11
%     f = figure('visible', 'off'); 
%     errorsurf = surf(error);
%     view([-50,50,45])
%     hold on;
%     point = scatter3(itr,jtr,error(itr,jtr), 100, 'r', 'filled');
%     saveas(f,strcat('errorplots/',num2str(counter)),'png')
%     counter = counter + 1;
%     end
% end


counter = 1
for itr = 1:3
    for jtr = 1:4
        f = figure('visible','off');
        subplot(2,1,1);
        scatter(tsneoutput(:,1,itr,jtr),tsneoutput(:,2,itr,jtr),2, 'filled');
        subplot(2,1,2);
        errorsurf = surf(error);
        ylabel('Golay Order');
        xlabel('Golay Kernel Size');
        zlabel('t-SNE Error');
        view([30,-20,20])
        hold on;
        point = scatter3(jtr,itr,error(itr,jtr), 100, 'r', 'filled');
        % Extract axes handles of all subplots from the figure

        axesHandles = findobj(get(f,'Children'), 'flat','Type','axes');

        % Set the axis property to square

        axis(axesHandles,'square')
        saveas(f,strcat('golayanimation2/',num2str(counter)),'png')
        counter = counter + 1;
        

    end
end


