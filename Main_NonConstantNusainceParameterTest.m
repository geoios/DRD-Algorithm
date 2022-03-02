%{
To test the nonconstant nusaince paramemter elimination
%}

clc; clear all; 

m      = 3;    % Number of main parameters
q      = 50;   % Number of nuisance parameters 
Loop   = 0;    % Recording the iteration times

for ObsNum = 3:350  % q is the number of each set of observations
    
    Loop = Loop + 1; 
    ks   = ones(1,q) * ObsNum;                    % Numbers of block observations

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %        +++++++++++ test data simulation  +++++++++++            %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    x = [1 1 1]';                                       % main parameter
    b = 0.1;                                            % nusaince parameter
    s = length(ks);
    for i=1:s
        As{i} = rand(ks(i),m);                            % productiong design martix
        zs{i} = rand(ks(i),1);                            % non-constant nusaince parameter's design matrix
        k = 0; %% vanish the random error to check the correctness of the algorithm
        Ls{i} = As{i} * x + zs{i};% + randn(ks(i),1) * k; % productiong Observations
        ps{i} = rand(ks(i),1);                            % productiong weighted
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % +++++++++++  test for unequal-weight case +++++++++++%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % Dimension-reduction algorithm 2                  
    StartTime_Dim2 = tic;                           % Record running time
    xdp2           = FastDiffSolUEW_General(As,Ls,ps,zs);      
    RunTime_Dim2   = toc(StartTime_Dim2);
end
