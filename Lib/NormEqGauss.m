function E1 = NormEqGauss(A,L,idx)
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
E = [N U];
%% exchange the two rows
if idx ~= 1
    E1        = E(idx,:);
    E(idx,:)  = [];
    E1(2:m,:) = E;
end
e1  = E1(1,:);
e11 = e1(1);
for i=2:m
    ei1 = E1(i,1);
    if ei1 ~= 0
       k = e11/ei1;
       E1(i,:) = E1(i,:) * k - e1;
    end
end