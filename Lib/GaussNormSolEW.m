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

function x = GaussNormSolEW(As,Ls)

%{
Inputs
    As : Design martix set of size BlockNum = number of nausiance paramters
    Ls : Observtion set of size BlockNum

Output
    x  : Undifferenced solution
%}

%% producce the equal-weighted matrix 
BlockNum = length(Ls);

%% apply the block-wise squential LS
[n m] = size(As{1});
N = zeros(m,m);
U = zeros(m,1);
for i = 1:BlockNum
    Ai = [As{i} ones(n,1)];
    Li = Ls{i};
    E1 = NormEqGauss(Ai,Li,m);
    Ni = E1(2:end,2:end-1);
    Ui = E1(2:end,end);
    N  = N + Ni;
    U  = U + Ui;
end
Qx = inv(N);
x  = Qx * U;     % Undifferenced solution