Model 1 and solution 1: Basic observational model only with main parameter x reads
====================

![model without nusaince parameter](https://latex.codecogs.com/svg.image?L\text{=}A{{X}_{1}}+e_L)

where e is the obervational error term. The least squares (LS) estimation of the main parameter x reads:

![LS solution of main parameter](https://latex.codecogs.com/svg.image?\hat{X}_o=({A^TP_{e_L}A})^{-1}A^TP_{e_L}L)

where P is the weight matrix of the observations，

![LS solution of main parameter](https://latex.codecogs.com/svg.image?Q_{\hat{X}_o}=(A_TA)^{-1})

is the co-factor matrix of the main parameters.

Model 2: Observational model augmented with nuisance parameters Δ reads
====================
![model without nusaince parameter](https://latex.codecogs.com/svg.image?L\text{=}A{{X}_{2}}+Z\Delta+e_L)

where e is the obervational error term.The least squares (LS) estimation of the main parameter x satisfies:

![model without nusaince parameter](https://latex.codecogs.com/svg.image?\begin{bmatrix}A^TP_{e_L}A&A^TP_{e_L}Z\\\\Z^TP_{e_L}A&Z^TP_{e_L}Z\\\\\end{bmatrix}=\begin{pmatrix}\hat{X_u}\\\\\hat{\Delta}\\\\\end{pmatrix}=\begin{bmatrix}A^TP_{e_L}L\\\\Z^TP_{e_L}L\end{bmatrix})

Solution 2-1: Nuisance parameter elimination solution
====================
According to the nuisance elimination theory, the least squares (LS) estimation of the main parameter x reads:

![LS solution of main parameter](https://latex.codecogs.com/svg.image?{\mathbf{\hat{X}}}_{u}\mathbf{=}{{\left[{{\mathbf{A}}^{T}}J\mathbf{A}\right]}^{-1}}{{\mathbf{A}}^{T}}J\mathbf{L})

where J is the reweighting matrix and it reads:

![LS solution of main parameter](https://latex.codecogs.com/svg.image?J\text{=}\left[P_{{{\varepsilon}_{L}}}^{{}}-P_{{{\varepsilon}_{L}}}^{{}}Z{{({{Z}^{T}}P_{{{\varepsilon}_{L}}}^{{}}Z)}^{-1}}{{Z}^{T}}P_{{{\varepsilon}_{L}}}^{{}}\right])

Solution 2-2: Differenced solution
====================
For the differencing operator K that satisfies

![LS solution of main parameter](https://latex.codecogs.com/svg.image?K^TZ=0)

left multiplying the differencing operator K to both sides of the model 2 will result in

![LS solution of main parameter](https://latex.codecogs.com/svg.image?\Delta_L=K^TL=K^TAX+K^Te_L)

With regard to the correlation between the differenced observations, i.e., the co-factor matrix of ΔL

![LS solution of main parameter](https://latex.codecogs.com/svg.image?K^TP_{e_L}^{-1}K)

then the differenced solution reads

![LS solution of main parameter](https://latex.codecogs.com/svg.image?\hat{X}_d=(A^T\widehat{P}_{e_L}A)^{-1}A\widehat{P}_{e_L}L)

where

![LS solution of main parameter](https://latex.codecogs.com/svg.image?\widehat{P}_{e_L}=K(K^TP_{e_L}^{-1}K)^{-1}K^T)

is called as differencing equivalence weight (DEW) matrix which also means to reweighting the observations like the solution 1. 

Equivalence between the solution 2-1 and solution 2-2
====================
Let n is the number of observations, if rank(K)=n-l, the solution 1 is equivalent to the solution 2 becuase of the following equality

![LS solution of main parameter](https://latex.codecogs.com/svg.image?J=\widehat{P}_{e_L})


Conversion between the solution 2-1 or 2-2 and solution 1  (equal-weight case)
====================
We can establish the following conversion formula between the solution 2-2 and soution 1

![LS solution of main parameter](https://latex.codecogs.com/svg.image?\hat{X}_d=\hat{X}_o-k_1k_2Q_{\hat{X}_o}\bar{a}^T)

where

![LS solution of main parameter](https://latex.codecogs.com/svg.image?k_1=(n-\bar{a}Q_{\hat{X}_o}\bar{a}^T)^{-1})

![LS solution of main parameter](https://latex.codecogs.com/svg.image?k_2=\sum_{i=1}^{n}V_i_o)

