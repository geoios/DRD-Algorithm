# Gauss elimination: is an efficient alogrithm solving both the sum of weighted squared residuals and the parameters 

## Normal equation and Gauss elimination
For the linear observation model L = Ax + e, the least-squares (LS) solution can be sloved by the following normal equation

![Normal equation](https://latex.codecogs.com/svg.image?Nx=U)

where

![Normal equation](https://latex.codecogs.com/svg.image?U=A^TPA)

![Normal equation](https://latex.codecogs.com/svg.image?U=A^TPL)

and the sum of weighted squared residuals reads

   ![Normal equation](https://latex.codecogs.com/svg.image?s=V^TPV=(L-Ax)^T(L-Ax))

However the above caculation on s is not the best strategy for the efficiecy aspect. In fact, it can be figured out efficiently without x, that：

   ![Normal equation](https://latex.codecogs.com/svg.image?L_1L_2,...,L_(m-1)\begin{pmatrix}N&U\\\\U^T&S\\\\\end{pmatrix}=\begin{pmatrix}N_k&U_k\\\\O&s\\\\\end{pmatrix})

where ![Normal equation](https://latex.codecogs.com/svg.image?S=L^TL) and Li is the Gauss elimination operator.

## Recusive Gauss elimination
In the context of the model selection, the recusive formula for s might be useful to avoid the caculation. For the basic model L = Ax + e, Assume that it is augmented by the model Zy, and then we can obtain the augmented model L = Ax + Zy + e. A problem arising is that, does the appending parameter y improve the fitting effectively? One way to solve this problem is the AIC or BIC criterion as
  
   


The least squares (LS) estimation of the main parameter x reads:

  ![LS solution of main parameter](https://latex.codecogs.com/svg.image?\hat{X}_o=({A^TP_{e_L}A})^{-1}A^TP_{e_L}L)

where P is the weight matrix of the observations.

  ![LS solution of main parameter](https://latex.codecogs.com/svg.image?Q_{\hat{X}_o}=(A^TP_{e_L}A)^{-1})

is the co-factor matrix of the main parameters.

# Observational model augmented with one nuisance parameter

