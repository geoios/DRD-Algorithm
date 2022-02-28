clc
clear all

open('Fix nuisan£¨UnEqual£©.fig');

lh = findall(gca,'type','line');
X = get(lh,'xdata');
Y = get(lh,'ydata');

RunTime_Dim1 = Y{4}';
RunTime_Blo1 = Y{3}';
RunTime_GE1  = Y{2}';
    
RunTime_Case1 = [RunTime_Dim1 RunTime_Blo1 RunTime_GE1];    
RunRatio_Equal = RunTime_Case1(:,2)./RunTime_Case1(:,1);

createfigure(RunTime_Case1, RunRatio_Equal)
xlabel('Number of nusaince parameters','FontWeight','bold','FontSize',15.4);
title({'Running time increasing with the number of nuisance parameters(Euqal-weight)'});
