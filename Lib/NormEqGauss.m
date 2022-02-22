function [E1 U1] = NormEqGauss(A,L,idx)
%% Fun : eliminate the idx parameter, e.g., idx = 1
%         N11 ...  N1m    |   N11 ...  N1m  
%         N21 ...  N2m    |   0   ...  N2m    
%         ............    |   ............
%         Nm1 ...  Nmm    |   0 .....  Nmm
%% idx : the column index
%% A   : design matrix 
%% L   : observation 

%% norm equation
m = size(A,2);
N = A'* A;
U = A' * L;
%% exchange the two rows
% if idx ~= 1
%     E1        = E(idx,:);
%     E(idx,:)  = [];
%     E1(2:m,:) = E;
% end
e1  = N(1,:);
e11 = e1(idx);
u1  = U(1);
s = 1;
for i = 2 : m
    ei1 = N(i,idx);
    if ei1 ~= 0
       k = e11/ei1;
       E1(s,:) = N(i,1:end) * k - e1;
       U1(s)   = U(i) * k   - u1;
       s = s + 1;
    end
end
E1(:,idx) = [];
end