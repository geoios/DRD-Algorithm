function [x RSS A F] = RecursionGuass_El(A0,L,P,RSS,Aug,F);

if nargin < 4
    if nargin ==2
       [N,U] = NormEqLS(A0,L);
    else
       [N,U] = NormEqWLS(A0,L,P);
    end
end

A = [N U; U' L'*L];

[n,n] = size(A);
F1=[];
F2=0;

if nargin < 4  %% 
    s=0;
    for j=1:n-1
        %q(j)=det(A(j+1:n-1,j+1:n-1))
        for i=1+s:n-1
            L=A(i+1,j)/A(j,j);
            A(i+1,:)=A(i+1,:)-L*A(j,:);
            F(j,i)=L;
        end
        s=s+1;
    end
    x(n-1)=A(n-1,n)/A(n-1,n-1);
    for i=n-2:-1:1
        sum=0;
        for j=i+1:(n-1) 
            sum=sum+A(i,j)*x(j);  
        end
        x(i)=(1/A(i,i))*(A(i,n)-sum);
    end
else  %% for model selection
    P=[A(n-1,1:n-2) A(n-1,n)];
    Q=P';
    s=0;
    k=1;
    for j=1:n-2
        for i=1+s:n-2
            Q(i+1)=Q(i+1)-F(j,i)*Q(j);
            k=k+1;
        end
        s=s+1;
    end
    
    Aug_new=[Aug(1:n-2,1:n-2) Q(1:n-2) Aug(1:n-2,n-1); ...
    A(n-1,:);...
    Aug(n-1,1:n-2) Q(n-1) Aug(n-1,n-1)];

    A=Aug_new;
    for j=1:n-2
            L=A(n-1,j)/A(j,j);
            A(n-1,:)=A(n-1,:)-L*A(j,:);
            F1(j)=L;
    end
%%%%%%%%%更新F矩阵
F2=A(n,n-1)/A(n-1,n-1);

A(n,n)=A(n,n)-F2*A(n-1,n);

F=[F(:,1:n-3) F1' F(:,n-2);zeros(1,n-2) F2];

    %回代
    x(n-1)=A(n-1,n)/A(n-1,n-1);
    %
    for i=n-2:-1:1
        sum=0;
        for j=i+1:(n-1) 
            sum=sum+A(i,j)*x(j);
            %
        end
        x(i)=(1/A(i,i))*(A(i,n)-sum);
        %
    end
end
RSS=abs(A(n,n));
x = x';
