Model 1: Basic observational model only with main parameter x reads
====================

![model without nusaince parameter](https://latex.codecogs.com/svg.image?L\text{=}A{{X}_{1}}+e)

where e is the obervational error term. The least squares (LS) estimation of the main parameter x reads:

![LS solution of main parameter](https://latex.codecogs.com/svg.image?{\mathbf{\hat{X}}}_{o}\mathbf{=}{{\left[{{\mathbf{A}}^{T}}P_{{{\varepsilon}_{L}}}^{{}}\mathbf{A}\right]}^{-1}}{{\mathbf{A}}^{T}}P_{{{\varepsilon}_{L}}}^{{}}\mathbf{L})

where P is the weight matrix of the observations.

Model2: Observational model augmented with nuisance parameters Δ reads
====================
![model without nusaince parameter](https://latex.codecogs.com/svg.image?L\text{=}A{{X}_{2}}+Z\Delta+e)

where e is the obervational error term.The least squares (LS) estimation of the main parameter x satisfies:

![model without nusaince parameter](https://latex.codecogs.com/svg.image?\begin{bmatrix}A^TP_{e_L}A&A^TP_{e_L}Z\\Z^TP_{e_L}A&Z^TP_{e_L}Z\\\end{bmatrix}=\begin{pmatrix}\hat{X_u}\\\hat{\Delta}\\\end{pmatrix}=\begin{bmatrix}A^TP_{e_L}L\\Z^TP_{e_L}L\end{bmatrix})

Solution 1: Nuisance elimination solution
====================
According to the nuisance elimination theory, the least squares (LS) estimation of the main parameter x reads:

![LS solution of main parameter](https://latex.codecogs.com/svg.image?{\mathbf{\hat{X}}}_{u}\mathbf{=}{{\left[{{\mathbf{A}}^{T}}J\mathbf{A}\right]}^{-1}}{{\mathbf{A}}^{T}}J\mathbf{L})

where J is the reweighting matrix and it reads:

![LS solution of main parameter](https://latex.codecogs.com/svg.image?J\text{=}\left[P_{{{\varepsilon}_{L}}}^{{}}-P_{{{\varepsilon}_{L}}}^{{}}Z{{({{Z}^{T}}P_{{{\varepsilon}_{L}}}^{{}}Z)}^{-1}}{{Z}^{T}}P_{{{\varepsilon}_{L}}}^{{}}\right])

Solution 2: Nuisance elimination solution
====================
According to the nuisance elimination theory, the least squares (LS) estimation of the main parameter x reads:
