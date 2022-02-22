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

function x = GaussNormSolUEW(As,Ls,Ps)

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
    Pi = Ps{i};
    idx = m + 1; % the eliminated parameter 
    [Ni Ui] = NormEqGauss_UEW(Ai,Li,Pi,idx);
    N  = N + Ni;
    U  = U + Ui';
end
Qx = inv(N);
x  = Qx * U;     % Undifferenced solution