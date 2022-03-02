function RSS = RSSGuass(A,L,P)
%% RSSGuass(A,L,P)
%% Function:use the Guass elimination to caculate
%% inputs:
 % + A % the design matrix
 % + L % observations
 % + P % observation weight matrix
%% outputs:
 % + RSS % residual sum of squares
%%%%%%%%%%%%%%%%%%%%% Test code %%%%%%%%%%%%%%%%%%%%%%%%%%%
 % A=[2 6 -4;1 4 -5;6 -1 18];
 % L=[4;3;2];
 % P=eye(3);
%% Outputs:
 % N = [41 10 95;10 53 -62;95 -62 365]
 % U = [23 34 5]
 % RSS = 1.4067
% RSS = RSSGuass(A,L,P)
[N,U] = NormEq(A,L,P)
Aug = [N U; U' L'*L];

s=0;
[n,n] = size(A);
for j=1:n-1
    for i=1+s:n-1
        L=Aug(i+1,j)/Aug(j,j);
        Aug(i+1,:)=Aug(i+1,:)-L*Aug(j,:);
    end
   s=s+1;
end
RSS = Aug(n,n);