function DrawFig(Y1,Y2)

X1 = 1:size(Y1,1);
figure('InvertHardcopy','off','Color',[1 1 1]);
axes1 = axes;
hold(axes1,'on');
yyaxis(axes1,'left');
plot(X1,Y1,'DisplayName','Dimension-reduction algorithm','MarkerSize',2,...
    'Marker','o',...
    'LineWidth',2,...
    'LineStyle','none',...
    'Color',[0 0 1]);

ylabel('Running time ({\its})');
set(axes1,'YColor',[0 0 1],'YMinorTick','off');
yyaxis(axes1,'right');
plot(X1,Y2,'DisplayName','Blocking-stacking algorithm','MarkerSize',2,...
    'Marker','pentagram',...
    'LineWidth',2,...
    'LineStyle','none',...
    'Color',[1 0 0]);
ylabel('Running time ({\its})','FontSize',15.4);
set(axes1,'YColor',[1 0 0],'YMinorTick','off');
box(axes1,'on');
set(axes1,'FontName','Times New Roman','FontSize',14,'FontWeight','bold');
legend1 = legend(axes1,'show');
set(legend1,'Location','northwest');

