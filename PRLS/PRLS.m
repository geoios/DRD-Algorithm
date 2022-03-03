function [x,Q,N,V,r] = PRLS(x,Q,N,V,r,A,a,P)
%% recursive LS in the parameter space 
% x : Parameter of funciton model
% Q : Variance of parameter vector x
% Ni: Normal eqation
% V : LS residuals
% r : the weighted sum of squared residuals
% A : New information of the new parameters
%%
a_Bar = P*a;
N2 = a_Bar'*a
N12= A' * a_Bar;

q2 = inv(N2 - N12'*Q*N12);
x2 = q2 * a_Bar' * V;
dx = Q * N12 * q2 * a_Bar' * V;

%% state undating
x = x - dx;                                   % old parameter updating
x = [x;x2]                                   % parameter extending

V = V + A*dx - a * x2;                    % residual updating
r = r + dx'* N * dx - x2' * N2 *x2;        % WSRS

%Q11= Q1 * [eye(i-1)-N12*q2*N12'*Q1 -N12*q2]; %% bad numerical stability
Q11= [inv(N - N12*q2*N12') -Q*N12*q2];
Q21= q2 * [-N12'* Q 1];
Q = [Q11;Q21];                              % variance matrix updating
N = [N N12;N12' N2];                        % extending the normal matrix
end