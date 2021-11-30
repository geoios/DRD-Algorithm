%%%%%% Paper citation information %%%%%%
Single-differenced Model for GNSS-A Point Positioning

%%%%%% Basic probblem with mutli nusaince parameters to be solved  %%%%%%
%The original observation model:
L = Ax + e
where
A = [A1  Z1  0 ... 0
     A2  0  Z2 ... 0
     ;  . .    ... 0
     An  0 0  ... Zn] 
L  = [L1; L2; ...; Ln]
Zi = [1 1 1...1]'

%The non-agumented observation model:
L = Bx + e
where
A = [A1
     A2
     .
     .
     An] 

%%%%%% conversion formula between the differenced solution and the undifferenced solution  %%%%%%
Case1: equal-weight
xd = xu - dx
dx = Q * am' * (n-am*Q*am')^-1 * vm
Q = (B'*P*B)^-1
am = sum(B)
vm = sum(v), where v = L - B * xu is the least squares
n is the number of observations

Case2: unqual-weight
The sum operator only need to become the weighted sum operator. such as
vm = wsum(v) = p1*v1 + p2*v2 + ...+ pn*vn

%%%%%% Function file list %%%%%%
+++ Example Code
Example 1 (Fixed the number of observations)
--> Main_Example1

Example 2 (Fixed the number of nuisance parameters)
--> Main_Example2

+++ Algorithm Code
Dimension-reduction algorithms
--> FastDiffSolEW      ...(Dimension-reduction algorithm for equal-weight observations)
--> FastDiffSol2UEW    ...(Dimension-reduction algorithm for unequal-weight observations)

Blocking-stacking algorithms
--> RapidDiffSolEW      ...(Blocking-stacking algorithm for equal-weight observations)
--> UnDiffSolSim        ...(Blocking-stacking algorithm for unequal-weight observations)

