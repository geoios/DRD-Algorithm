Model 1 and solution 1: Basic observational model only with main parameter x reads
=====================

![model without nusaince parameter](https://latex.codecogs.com/svg.image?L\text{=}A{{X}_{1}}+e_L)

where e is the obervational error term. The least squares (LS) estimation of the main parameter x reads:

![LS solution of main parameter](https://latex.codecogs.com/svg.image?\hat{X}_o=({A^TP_{e_L}A})^{-1}A^TP_{e_L}L)

where P is the weight matrix of the observations�?

![LS solution of main parameter](https://latex.codecogs.com/svg.image?Q_{\hat{X}_o}=(A^TA)^{-1})

is the co-factor matrix of the main parameters.

Model 2: Observational model augmented with one nuisance parameter Δ reads
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


Conversion formula between the solution 2-1 or 2-2 and solution 1
====================
In equal-weight case, we can establish the following conversion formula between the solution 2-2 and soution 1

![LS solution of main parameter](https://latex.codecogs.com/svg.image?\hat{X}_d=\hat{X}_o-k_1k_2Q_{\hat{X}_o}\bar{a}^T)

where

![LS solution of main parameter](https://latex.codecogs.com/svg.image?k_1=(n-\bar{a}Q_{\hat{X}_o}\bar{a}^T)^{-1})

![LS solution of main parameter](https://latex.codecogs.com/svg.image?k_2=\sum_{i=1}^{n}V_i_o)

![LS solution of main parameter](https://latex.codecogs.com/svg.image?\bar{a}=\begin{pmatrix}\sum_{i=1}^{n}a_i_1&\sum_{i=1}^{n}a_i_2&...&\sum_{i=1}^{n}a_i_{(m-1)}\\\\\end{pmatrix})

where ![L](https://latex.codecogs.com/svg.image?a_i_j) is the entry of the matrix A.

The above formula can be generalized to the unequal weight case, that

![LS solution of main parameter](https://latex.codecogs.com/svg.image?k_1=(\sum_{i=1}^{n}p_i\bar{a}Q_{\hat{X}_o}\bar{a}^T)^{-1})

![LS solution of main parameter](https://latex.codecogs.com/svg.image?k_2=\sum_{i=1}^{n}p_iV_i_o)

![LS solution of main parameter](https://latex.codecogs.com/svg.image?\bar{a}=\begin{pmatrix}\sum_{i=1}^{n}p_ia_i_1&\sum_{i=1}^{n}p_ia_i_2&...&\sum_{i=1}^{n}p_ia_i_{(m-1)}\\\\\end{pmatrix})

where pi are the weights of the observations. The conversion formula between the variance estimations can also be established.

--------------------------
  The conversion formula can be generalized from one nusiance parameter to multi nusiance parameters of the following form
  
![LS solution of main parameter](https://latex.codecogs.com/svg.image?\begin{pmatrix}L_1\\\\L_2\\\\...\\\\L_q\end{pmatrix}=\begin{pmatrix}A_1&Z_1&0&...&0\\\\A_2&0&Z_2&...&0\\\\...&...&...&...&...\\\\A_q&0&0&...&Z_q\\\\\end{pmatrix}\begin{pmatrix}X\\\\\Delta_1\\\\...\\\\\Delta_q\end{pmatrix}+\begin{pmatrix}e_1\\\\e_2\\\\...\\\\e_q\end{pmatrix})

Dimension-reduction algorithm based on the conversion formula
====================
We can develop a very efficient algorithm solving the model with nusiance parameters based on the conversion formulae. The code files are listed as follows: 

Example code 1 (Fixed the number of observations)
----------------------

--> Main_Example1

Example code 2 (Fixed the number of nuisance parameters)
---------------------------

--> Main_Example2

Dimension-reduction algorithms
-------------------------------

--> FastDiffSolEW      ...(Dimension-reduction algorithm for equal-weight observations)

--> FastDiffSol2UEW    ...(Dimension-reduction algorithm for unequal-weight observations)

Blocking-stacking algorithms
-----------------------------

--> RapidDiffSolEW      ...(Blocking-stacking algorithm for equal-weight observations)

--> UnDiffSolSim        ...(Blocking-stacking algorithm for unequal-weight observations)
