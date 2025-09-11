# MATLAB Simulation Model - New probabilistic multi-criteria model for assessing the integral sustainability of private cars with different propulsion systems

New probabilistic multi-criteria model for assessing the integral sustainability of private cars with different propulsion systems, Juan José Cartelle Barros, Jesús Cardenal, M. Pilar de la Cruz López, Alfredo del Caño Gochi, Journal of Cleaner Production, 2025.

> https://doi.org/... 

This paper is currently under review. The reviewers have requested that the model be uploaded to a repository to make it accessible.

## 

## Requirements

* MATLAB R2022b or newer.

## 

## General description

This repository contains the MATLAB code to reproduce published results of case 2

It consists of a total of 14 MATLAB functions:

* FVcontinua.m: The same function as in the Case 1 folder.
* FVdiscreta2.m: The same function as in the Case 1 folder.
* Maletero.m: The same function as in the Case 1 folder.
* betaPERT.m: Function required to generate pseudo-random numbers according to a beta-PERT distribution.
* CocheCombProbabilistaCorrelacionado\_28\_03\_2025\_PERT: This function performs the Monte Carlo simulation for a generic conventional vehicle. It contains the data defined in the paper for this type of vehicle, including the corresponding correlations between indicators. It returns the basic statistical parameters for the partial and total sustainability indices, as well as all the indices obtained during the simulation. It also provides the option to generate graphical representations (cumulative probability curves and frequency histograms). At the environmental level, it employs the Green NCAP indicators.
* CocheCombProbabilistaCorrelacionado\_28\_03\_2025\_PERT\_Dincer: The same as the previous function, but in this case using environmental values based on the work of Bicer and Dincer (doi:10.1016/j.resconrec.2018.01.036).
* CocheElecProbabilistaCorrelacionado\_28\_03\_2025\_PERT.m: The same as function CocheCombProbabilistaCorrelacionado\_28\_03\_2025\_PERT, but for a generic EV.
* CocheElecProbabilistaCorrelacionado\_28\_03\_2025\_PERT\_DINCER.m: The same as the previous function, but in this case using environmental values based on the work of Bicer and Dincer (doi:10.1016/j.resconrec.2018.01.036).
* CocheHEVProbabilistaCorrelacionado\_28\_03\_2025\_PERT.m: The same as function CocheCombProbabilistaCorrelacionado\_28\_03\_2025\_PERT, but for a generic HEV.
* CocheHEVProbabilistaCorrelacionado\_28\_03\_2025\_PERT\_DINCER.m: The same as the previous function, but in this case using environmental values based on the work of Bicer and Dincer (doi:10.1016/j.resconrec.2018.01.036).
* CochePHEVProbabilistaCorrelacionado\_28\_03\_2025\_PERT.m: The same as function CocheCombProbabilistaCorrelacionado\_28\_03\_2025\_PERT, but for a generic PHEV.
* CochePHEVProbabilistaCorrelacionado\_28\_03\_2025\_PERT\_DINCER.m: The same as the previous function, but in this case using environmental values based on the work of Bicer and Dincer (doi:10.1016/j.resconrec.2018.01.036).
* RepresentacionesGraficas\_PERT.m: Function that simultaneously calls functions CocheCombProbabilistaCorrelacionado\_28\_03\_2025\_PERT, CocheElecProbabilistaCorrelacionado\_28\_03\_2025\_PERT.m, CocheHEVProbabilistaCorrelacionado\_28\_03\_2025\_PERT.m, and CochePHEVProbabilistaCorrelacionado\_28\_03\_2025\_PERT.m, generating graphical representations (cumulative probability curves and frequency histograms), as well as numerical results.
* RepresentacionesGraficas\_PERT\_DINCER.m: The same as the previous function, but in this case using CocheCombProbabilistaCorrelacionado\_28\_03\_2025\_PERT\_DINCER, CocheElecProbabilistaCorrelacionado\_28\_03\_2025\_PERT\_DINCER.m, CocheHEVProbabilistaCorrelacionado\_28\_03\_2025\_PERT\_DINCER.m, and CochePHEVProbabilistaCorrelacionado\_28\_03\_2025\_PERT\_DINCER.m.


## How to cite

If you use this model or any part of this repository in your work, please cite the following publication:

Cartelle Barros, J.J., Cardenal, J., de la Cruz López, M.P., del Caño Gochi, A. (2025). New probabilistic multi-criteria model for assessing the integral sustainability of private cars with different propulsion systems. Journal of Cleaner Production, Volume X, Article number Y. https://doi.org/xx.xxxx/xxxxxxxx.

This paper is currently under review. The reviewers have requested that the model be uploaded to a repository to make it accessible.





