%{
% This function is made by Shuqiang Xue, Wenlong Yang
%% Basic problem: solve the following form equation system by the least sqaures LS 
% L = Ax + e
% A = [A1  Z1 0 ... 0
%      A2  0 Z2 ... 0
%       ;  . .  ... 0
%      An  0 0  ... Zn] 
% Where Zi = ones(ki,1),ki is the observation number of the ith sub equation

%% Rapid differenced solution alogrithm based on block-wise squential LS and the differenced eq.. weight (DEW) matrix as
%          | n-1  -1   -1  ... -1 |
%          | -1   n-1  -1  ... -1 |
% P = 1/n  | -1   -1   n-1 ... -1 |
%          |......................|
%          | -1  -1   .........n-1|
       
%}
function x = UnDiffSolUEW(As,Ls,ps)
%{
Inputs
    As : Design martix set of size BlockNum = number of nausiance paramters
    Ls : Observtion set of size BlockNum
    Ps : BlockNum  The weight set of size Bl
    
Output
    x  : Undifferenced solution
%}

%% producce the DEW matrix 
BlockNum = length(Ls);
for i = 1:BlockNum
    si{i} = 1/sum(ps{i});
    ni = length(ps{i});
    pzzt = -si{i} * ones(ni,ni).*ps{i};
    for j = 1:ni
        pzzt(j,j) = pzzt(j,j) + 1;
    end
    Ps{i} = pzzt.*ps{i}';
end

m = size(As{1},2);
N = zeros(m,m);
U = zeros(m,1);

%% apply the block-wise sequential least squares
for i = 1:BlockNum
    Ai = As{i};
    Li = Ls{i};
    N  = N + Ai'* Ps{i} * Ai ;
    U  = U + Ai'* Ps{i} * Li;
end
Qx = inv(N);
x = Qx * U;    % Undifferenced solution
