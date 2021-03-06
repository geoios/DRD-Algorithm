function createfigure(YMatrix1, Y1)

% 创建 figure
figure1 = figure('InvertHardcopy','off','Color',[1 1 1]);

% 创建 axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% 激活坐标区的 left 侧
yyaxis(axes1,'left');
% 使用 plot 的矩阵输入创建多行
plot1 = plot(YMatrix1,'LineWidth',2);
set(plot1(1),'DisplayName','Dimension-reduction algorithm',...
    'MarkerFaceColor',[1 0 1],...
    'MarkerSize',4,...
    'Marker','square',...
    'LineStyle','none',...
    'Color',[1 0 1]);
set(plot1(2),'DisplayName','Blocking-stacking algorithm',...     %Blocking-stacking algorithm
    'MarkerFaceColor',[0 0 1],...
    'MarkerSize',3,...
    'Marker','diamond',...
    'LineStyle','none',...
    'Color',[0 0 1]);

set(plot1(3),'DisplayName','One-by-one elimination algorithm',...
    'MarkerFaceColor',[0 1 0],...
    'MarkerSize',3,...
    'Marker','*',...
    'LineStyle','none',...
    'Color',[0 1 0]);

% 创建 ylabel
ylabel('Running time ({\its})','FontWeight','bold','FontSize',20);

% 设置其余坐标区属性
set(axes1,'YColor',[0.149019607843137 0.149019607843137 0.149019607843137],...
    'YMinorTick','off');
% 激活坐标区的 right 侧
yyaxis(axes1,'right');
% 创建 plot
plot(Y1,'DisplayName','Speed ratio','MarkerFaceColor',[1 1 1],...
    'MarkerSize',4,...
    'Marker','o',...
    'LineWidth',2,...
    'LineStyle','none',...
    'Color',[1 0 0]);

% 创建 ylabel
ylabel('Speed ratio','FontWeight','bold','FontSize',20);

% 设置其余坐标区属性
set(axes1,'YColor',[1 0 0]);
% 创建 xlabel
% xlabel('Number of nusaince parameters','FontWeight','bold','FontSize',15.4);
box(axes1,'on');
% 设置其余坐标区属性
set(axes1,'FontName','Times New Roman','FontSize',14,'LineStyleOrderIndex',...
    2);
% 创建 legend
legend1 = legend(axes1,'show');
set(legend1,...
    'Position',[0.138795045045045 0.772028968690592 0.278082775616565 0.136086959507154],...
    'FontSize',12.6);

