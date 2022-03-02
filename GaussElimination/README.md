# Gauss elimination: is an efficient alogrithm solving both the weighted sum of squared residuals (WSSR) and the parameters 

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

  BIC = n*ln(s/n) + ln(n)*m + n(1+ln(𝝿))
  
where n is the observation number and m is the parameter number. Only if the BIC decreases the parameter y is considered to be effective to improve the model; otherwise, it should be refused and then to solve the basic model to obtain the x. Obviously, the Gauss elimination gives an appoach to efficiently obtain the s without figuring out x. Besides this, in the context of Gauss elimination we can establish a recusive formula for the s, and it reads:

   s2 = s1 - k * y

where s1 the WSSR of the basic model, and s2 is the WSSR of the augmented model L = Ax + Zy + e, k can be otained in the Gauss elimination. The recusive formula for x can be given in the context of Gauss elimination.

## Partial Gauss elimination

   Partial Gauss elimination can be applied to eliminate the nusaince paramters to obtain the concerned parameters. In the augmented model L = Ax + Zy + e, assume that y is the nusaince paramter, and then we can obtain the following normal equation
   
![Normal equation](https://latex.codecogs.com/svg.image?\begin{pmatrix}N_x_x&N_x_y\\\\N_y_x&N_y_y\\\\\end{pmatrix}=\begin{pmatrix}U_x\\\\U_y\end{pmatrix})

Applying one step Gauss elimination on the above equation, we have

![Normal equation](https://latex.codecogs.com/svg.image?\begin{pmatrix}N_x_x^{'}&0\\\\N_x_y&N_y_y\\\\\end{pmatrix}=\begin{pmatrix}U_x^{'}\\\\U_y\end{pmatrix})

then solving the euqaiton N'x=U' will result in the main parameter estimation. This is also called as one-by-one elimination.
