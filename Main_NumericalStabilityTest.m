%{ 
To Test the numercial stablility of the alogrithm
%}

clc; clear all; 

m      = 3;    % Number of main parameters
q      = 50;   % Number of nuisance parameters 
Loop   = 0;    % Recording the iteration times
k = 1;
for ObsNum = 3:3:30  % q is the number of each set of observations
    
    Loop = Loop + 1; 
    ks   = ones(1,q) * ObsNum;                    % Numbers of block observations

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %        +++++++++++ test data simulation  +++++++++++            %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    x = [1 1 1]';                                       % main parameter
    b = 0.1;                                            % nusaince parameter
    for i=1:length(ks)
        As{i} = rand(ks(i),m);                          % productiong design martix
        Ls{i} = As{i} * x + b + randn(ks(i),1) * 1;   % productiong Observations
        ps{i} = ones(ks(i),1);                          % productiong weighted
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % +++++++++++ performance test for equal-weight case +++++++++++  %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Dimension-reduction algorithm
    xdp1             = FastDiffSolEW(As,Ls) ;       % Equal-weight
    
    % Blocking-stacking algorithm
    xdp2           = UnDiffSolEW(As,Ls) ;         % Equal-weight
    
    % Gauss elimination
    xdp3          = GaussNormSolEW(As,Ls);       % Equal-weight
    
    % RunningTime = [Dimension-reduction , Blocking-stacking]
    xs(k,1:3) = [xdp1(1) xdp2(1) xdp3(1)];
    ys(k,1:3) = [xdp1(2) xdp2(2) xdp3(2)];
    zs(k,1:3) = [xdp1(3) xdp2(3) xdp3(3)];
    k  =  k + 1;
end
