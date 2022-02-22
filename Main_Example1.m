%{
        This is an example to show how to use the dimension-reduction algorithm function.
        At the same time, the computational efficiency of blocking-stacking algorithm  and
        dimension-reduction algorithm are compared.

        In the presented example, the number of each set of observations is intially set as ObsNum = 30,
        and the number q of nuisance parameters gradually increase from 1
        to 50 to test the proposed algorithm performance
%}

clc; clear all; close all;
m      = 3;   % Number of parameter estimates
ObsNum = 1000;  % Number of observations
for q = 1:200  % q is the number of nuisance parameters
    ks = ones(1,q) * ObsNum;                      % Number of Block observations
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %        +++++++++++ test data simulation  +++++++++++            %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    x  = [1 1 1]';                                      % main parameter
    b  = 0.1;                                           % nusaince parameter
    for i=1:length(ks)
        As{i} = rand(ks(i),m);                          % productiong design martix
        Ls{i} = As{i} * x + b + randn(ks(i),1) * 1;     % productiong Observations
        ps{i} = ones(ks(i),1);                          % productiong weighted
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % +++++++++++ performance test for equal-weight case +++++++++++  %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Dimension-reduction algorithm
    StartTime_Dim1 = tic;                         % Record running time(Dimension-reduction algorithm)
    xd             = FastDiffSolEW(As,Ls);        % Equal-weight
    RunTime_Dim1   = toc(StartTime_Dim1);
    % Blocking-stacking algorithm
    StartTime_Blo1 = tic;                         % Record running time(Blocking-stacking algorithm)
    xdp            = UnDiffSolEW(As,Ls);          % Equal-weight
    RunTime_Blo1   = toc(StartTime_Blo1);
    % Saving runningTime
    RunTime_Case1(q,:) = [RunTime_Dim1   ,  RunTime_Blo1];
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % +++++++++++ performance test for unequal-weight case +++++++++++%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Dimension-reduction algorithm                   
    StartTime_Dim2 = tic;                           % Record running time
    xd             = FastDiffSolUEW(As,Ls,ps);      % Unequal-weight
    RunTime_Dim2   = toc(StartTime_Dim2);
    % Blocking-stacking algorithm                
    StartTime_Blo2 = tic;                           % Record running time
    x2             = UnDiffSolUEW(As,Ls,ps);        % Unequal-weight          
    RunTime_Blo2   = toc(StartTime_Blo2);
    % Saving runningTime
    RunTime_Case2(q,:) = [RunTime_Dim2   ,  RunTime_Blo2];
end



RunRatio_Equal = RunTime_Case1(:,2)./RunTime_Case1(:,1);
RunRatio_UnEqual = RunTime_Case2(:,2)./RunTime_Case2(:,1);
% Drawing results (Equal-weight case)
createfigure(RunTime_Case1, RunRatio_Equal)
xlabel('Number of nusaince parameters','FontWeight','bold','FontSize',15.4);
title({'Running time increasing with the number of nuisance parameters(Euqal-weight)'});
% Drawing results( Unequal-weight case)
createfigure(RunTime_Case2, RunRatio_UnEqual)
xlabel('Number of nusaince parameters','FontWeight','bold','FontSize',15.4);
title({'Running time increasing with the number of nuisance parameters(Uneuqal-weight)'});















