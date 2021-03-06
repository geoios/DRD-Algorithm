%{
% This function is made by Shuqiang Xue, Wenlong Yang
%% Basic problem: solve the following form equation system by the least sqaures LS 
% L = Ax + e
% A = [A1  Z1 0 ... 0
%      A2  0 Z2 ... 0
%       ;  . .  ... 0
%      An  0 0  ... Zn] 
% Where Zi = [zi1,zi2,...,zin]',ki is the observation number of the ith sub equation
% Note that Zi might be not equal to [1,1,...,1]'.
%}

function xd = FastDiffSolUEW_General(As,Ls,Ps,Zs)
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

%% apply the block-wise sequential least squares to slove the undifferenced solution
for i = 1:BlockNum
%     for j=1:ni
%        N  = N + Ai(j,:)'* Ai(j,:) * pi(j);
%        U  = U + Ai(j,:)'* Li(j,:) * pi(j);
%     end
    Ni = As{i}'.*Ps{i}'*As{i};
    Ui = As{i}'.*Ps{i}'*Ls{i};
    N = N + Ni;
    U = U + Ui;
    %%%
    pi{i} = Ps{i}.*Zs{i};
    C  = [C;sum(As{i}.*pi{i})];
end

%% apply the differenced and undifferenced solution conservsion formulea
Qx = inv(N);
x0 = Qx * U;                  %% undifferenced solution
S = - C * Qx * C';
Y = [];
for i = 1:BlockNum
    S(i,i) = S(i,i) + sum(pi{i}.*Zs{i});
    Vi  = Ls{i} - As{i} * x0;
    Y = [Y;sum(Vi.*pi{i})];
end

K  = Qx * C'* inv(S);
dx = K  * Y;                  %% the main paramter correction
xd = x0 - dx;                 %% differenced solution
