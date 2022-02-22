%{
        This is an example to show how to use the dimension-reduction algorithm function.
        At the same time, the computational efficiency of blocking-stacking algorithm  and
        dimension-reduction algorithm are compared.

        At first, assume that the number q of nuisance parameters is fixed to be  q = 20, and the number 
        of each set of observations gradually increase from 20 to 200 to test the proposed 
        algorithm performance.
%}

clc; clear all; 

m      = 3;    % Number of main parameters
q      = 50;   % Number of nuisance parameters 
Loop   = 0;    % Recording the iteration times

for ObsNum = 350:500  % q is the number of each set of observations
    
    Loop = Loop + 1; 
    ks   = ones(1,q) * ObsNum;                    % Numbers of block observations

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %        +++++++++++ test data simulation  +++++++++++            %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    x = [1 1 1]';                                       % main parameter
    b = 0.1;                                            % nusaince parameter
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
    xdp1             = FastDiffSolEW(As,Ls) ;       % Equal-weight
    RunTime_Dim1   = toc(StartTime_Dim1);
    
    % Blocking-stacking algorithm
    StartTime_Blo1 = tic;                         % Record running time(Blocking-stacking algorithm)
    xdp2            = UnDiffSolEW(As,Ls) ;         % Equal-weight
    RunTime_Blo1   = toc(StartTime_Blo1);
    
    % Gauss elimination
    StartTime_GE1 = tic;                         % Record running time(Blocking-stacking algorithm)
    xdp3           = GaussNormSolEW(As,Ls);       % Equal-weight
    RunTime_GE1   = toc(StartTime_GE1);
    
    % RunningTime = [Dimension-reduction , Blocking-stacking]
    RunTime_Case1(Loop,:) = [RunTime_Dim1   RunTime_Blo1];%,  RunTime_Blo1, 
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % +++++++++++ performance test for unequal-weight case +++++++++++%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Dimension-reduction algorithm                   
    StartTime_Dim2 = tic;                           % Record running time
    xd             = FastDiffSolUEW(As,Ls,ps);      
    RunTime_Dim2   = toc(StartTime_Dim2);
    
    % Blocking-stacking algorithm                
    StartTime_Blo2 = tic;                           % Record running time
    x2             = UnDiffSolUEW(As,Ls,ps);                 
    RunTime_Blo2   = toc(StartTime_Blo2);
    
    RunTime_Case2(Loop,:) = [RunTime_Dim2   ,  RunTime_Blo2];
end

RunRatio_Equal = RunTime_Case1(:,2)./RunTime_Case1(:,1);
RunRatio_UnEqual = RunTime_Case2(:,2)./RunTime_Case2(:,1);

% plot(RunRatio_Equal)
createfigure(RunTime_Case1, RunRatio_Equal)
xlabel('Number of observations','FontWeight','bold','FontSize',15.4);
title({'Running time increasing with the number of observations(Euqal-weight)'});
% Drawing results( Unequal-weight case)
createfigure(RunTime_Case2, RunRatio_UnEqual)
xlabel('Number of observations','FontWeight','bold','FontSize',15.4);
title({'Running time increasing with the number of observations(Uneuqal-weight)'});








