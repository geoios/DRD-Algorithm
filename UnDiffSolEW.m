%{
% This function is made by Shuqiang Xue, Wenlong Yang
%% Basic problem: solve the following form equation system by the least sqaures LS 
% L = Ax + e
% A = [A1  Z1 0 ... 0
%      A2  0 Z2 ... 0
%       ;  . .  ... 0
%      An  0 0  ... Zn] 
% Where Zi = ones(ki,1),ki is the observation number of the ith sub equation

%% Rapid differenced solution alogrithm based on block-wise squential LS

%}

function x = UnDiffSolEW(As,Ls)

%{
Inputs
    As : Design martix set of size BlockNum = number of nausiance paramters
    Ls : Observtion set of size BlockNum

Output
    x  : Undifferenced solution
%}

%% producce the equal-weighted matrix 
BlockNum = length(Ls);
for i = 1:BlockNum
    ni = length(Ls{i});
    Pi = -ones(ni,ni);
    for j =1:ni
        Pi(j,j) = Pi(j,j) + ni;
    end
    Ps{i} = Pi/ni;
end

%% apply the block-wise squential LS
m = size(As{1},2);
N = zeros(m,m);
U = zeros(m,1);
for i = 1:BlockNum
    Ai = As{i};
    Li = Ls{i};
    N  = N + Ai'* Ps{i} * Ai ;
    U  = U + Ai'* Ps{i} * Li;
end
Qx = inv(N);
x = Qx * U;     % Undifferenced solution
