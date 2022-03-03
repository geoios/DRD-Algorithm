clc
clear all

n = 100;
K = 5;
P = diag(ones(n,1));

for k = 1:K
CD = 100;
    while CD > 4
        a = randn(n,1);
        A(1:n,k) = a;
        CD = cond(A);
        continue;
    end
end
tx = ones(K,1) * 1;

for i=1:n
    L = A*tx;
end
Q1_ref = inv(A'*P*A);
x_ref = Q1_ref*A'*P*L;


a     = A(:,1);
a_Bar = P*a;
N     = a_Bar'*a;
Q     = inv(N);
x(1,:) = Q * a_Bar' * L;
V = L - a*x;
r = V'*P*V;
rs(1) = r;
for i =2:K
    [x,Q,N,V,r] = PRLS(x,Q,N,V,r,A(:,1:i-1),A(:,i),P);
    rs(i) = r;
end
Q1_ref - Q
x_ref - x

