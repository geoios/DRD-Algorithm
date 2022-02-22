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
    dx = Q * am' * (n-am*Q*am')^-1 * vm
    Q = (B'*P*B)^-1
    am = sum(B)
    vm = sum(v), where v = L - B * xu is the least squares
    n is the number of observations
%}

function xd = FastDiffSolEW(As,Ls)
%{
Inputs
    As : Design martix set of size BlockNum = number of nausiance paramters
    Ls : Observtion set of size BlockNum
    
Output
    xd : Undifferenced-derived differenced solution
%}

m = size(As{1},2);
N = zeros(m,m);
U = zeros(m,1);
BlockNum = length(Ls);
C = [];

%% for applying the block-wise sequential least squares to slove the undifferenced solution
for i = 1:BlockNum
    N  = N + As{i}'* As{i};
    U  = U + As{i}'* Ls{i};
    C  = [C;sum(As{i})];
end

%% apply the differenced and undifferenced solution conservsion formulea
Qx = inv(N);
x0 = Qx * U;          %% undifferenced solution
S = - C * Qx * C';
Y = [];
for i = 1:BlockNum
    S(i,i) = S(i,i) + length(Ls{i});
    %for j=1:10^7
    %Vi  = sum(Ls{i} - As{i} * x0);
    Vi = sum(Ls{i}) - C(i,:) * x0;
    %end
    Y = [Y;Vi];
end

K  = Qx * C'* inv(S);
dx = K  * Y;           %% the main paramter correction
xd = x0 - dx;          %% differenced solution
