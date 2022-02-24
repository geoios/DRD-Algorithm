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


% plot(RunRatio_Equal)
createfigure(xs(:,2)-xs(:,1), xs(:,3)-xs(:,1))
xlabel('Number of observations','FontWeight','bold','FontSize',15.4);
title({'Running time increasing with the number of observations(Euqal-weight)'});
