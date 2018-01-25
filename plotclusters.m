subaxis(8,1,1, 'SpacingVert', 0);
plot(1:totallength, waves);
ylabel('Wave');

set(gca,'xtick',[])
set(gca,'xticklabel',[])
set(gca,'YTickLabel',[]);

subaxis(8,1,2, 'SpacingVert', 0);
plot(1:totallength, clusterwaves1);
ylabel('1');
set(gca,'xtick',[])
set(gca,'xticklabel',[])
set(gca,'YTickLabel',[]);

subaxis(8,1,3, 'SpacingVert', 0);
plot(1:totallength, clusterwaves2);
ylabel('2');
set(gca,'xtick',[])
set(gca,'xticklabel',[])
set(gca,'YTickLabel',[]);

subaxis(8,1,4, 'SpacingVert', 0);
plot(1:totallength, clusterwaves3);
ylabel('3');
set(gca,'xtick',[])
set(gca,'xticklabel',[])
set(gca,'YTickLabel',[]);

subaxis(8,1,5, 'SpacingVert', 0);
plot(1:totallength, clusterwaves4);
ylabel('4');
set(gca,'xtick',[])
set(gca,'xticklabel',[])
set(gca,'YTickLabel',[]);

subaxis(8,1,6, 'SpacingVert', 0);
plot(1:totallength, clusterwaves5);
ylabel('5');
set(gca,'xtick',[])
set(gca,'xticklabel',[])
set(gca,'YTickLabel',[]);

subaxis(8,1,7, 'SpacingVert', 0);
plot(1:totallength, clusterwaves6);
ylabel('6');
set(gca,'xtick',[])
set(gca,'xticklabel',[])
set(gca,'YTickLabel',[]);

subaxis(8,1,8, 'SpacingVert', 0);
plot(1:totallength, clusterwaves7);
ylabel('7');
set(gca,'YTickLabel',[]);