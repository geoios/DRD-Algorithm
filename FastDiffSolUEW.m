%{
% This function is made by Shuqiang Xue, Wenlong Yang
%% Basic problem: solve the following form equation system by the least sqaures LS 
% L = Ax + e
% A = [A1  Z1 0 ... 0
%      A2  0 Z2 ... 0
%       ;  . .  ... 0
%      An  0 0  ... Zn] 
% Where Zi = ones(ki,1),ki is the observation number of the ith sub equation

%The non-agumented observation model:
L = Bx + v
where
A = [A1
     A2
     .
     .
     An] 

%% differenced and undifferenced solution conservsion formulea used are as follows
    xd = xu - dx
    dx = Q * am' * (wm - am*Q*am')^-1 * vm
    Q = (B'*P*B)^-1
    vm = wsum(P), where P is the weight vector
    am = wsum(B)
    vm = wsum(v), where v = L - B * xu is the least squares
    n is the number of observations
%}

function xd = FastDiffSolUEW(As,Ls,Ps)
%{
inputs
    As : Design martix set of size BlockNum = number of nausiance paramters
    Ls : Observtion set of size BlockNum
    Ps : The weight set of size BlockNum 
    
 Output
    xd : Undifferenced-derived differenced solution
%}

%% producce the DEW matrix 
m = size(As{1},2);        % Number of parameter estimates
N = zeros(m,m);           % Ni = A' * P * A
U = zeros(m,1);           % Ui = A' * P * L
BlockNum = length(Ls);   
C = [];

%% apply the block-wise sequential least squares
for i = 1:BlockNum
    Ai = As{i};
    ni = size(Ai,1);
    pi = Ps{i};
    Li = Ls{i};
    for j=1:ni
       N  = N + Ai(j,:)'* Ai(j,:) * pi(j);
       U  = U + Ai(j,:)'* Li(j,:) * pi(j);
    end
    C  = [C;sum(Ai.*pi)];
end

%% apply the differenced and undifferenced solution conservsion formulea
Qx = inv(N);
x0 = Qx * U;                  %% undifferenced solution
S = - C * Qx * C';
Y = [];
for i = 1:BlockNum
    S(i,i) = S(i,i) + sum(Ps{i});
    Vi  = Ls{i} - As{i} * x0;
    Y = [Y;sum(Vi.*Ps{i})];
end

K  = Qx * C'* inv(S);
dx = K  * Y;                  %% the main paramter correction
xd = x0 - dx;                 %% differenced solution
