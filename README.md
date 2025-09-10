# MATLAB Simulation Model - New probabilistic multi-criteria model for assessing the integral sustainability of private cars with different propulsion systems



This repository contains the MATLAB code as well as an spreadsheet associated with the paper:

New probabilistic multi-criteria model for assessing the integral sustainability of private cars with different propulsion systems, Juan José Cartelle Barros, Jesús Cardenal, M. Pilar de la Cruz López, Alfredo del Caño Gochi, Journal of Cleaner Production, 2025.

> https://doi.org/... 

This paper is currently under review. The reviewers have requested that the model be uploaded to a repository to make it accessible.

## 

## Requirements

* MATLAB R2022b or newer.
* Microsoft Excel 2016 or newer.

## 

## General description

This repository contains the model associated with the paper titled "New probabilistic multi-criteria model for assessing the integral sustainability of private cars with different propulsion systems." It is organised into three folders: (1) Case 1, (2) Case 2, and (3) Excel model.



The first two folders contain the functions required to generate the results in MATLAB for Case Studies 1 and 2 presented in the paper. The third folder provides an spreadsheet with a deterministic version of the model and it is intended for users who are not familiar with MATLAB, and also for users who wish to evaluate other specific market models different from those presented in the paper.





## Folder: Case 1

It consists of a total of 11 MATLAB functions:

* FVcontinua.m: It is an auxiliary function associated with the value functions of continuous indicators (MIVES method). It returns the satisfaction level for a given value function.
* FVdiscreta2.m: It is an auxiliary function associated with the value functions of discrete indicators (MIVES method). It returns the satisfaction level for a given value function.
* Maletero.m: It is an auxiliary function associated with the indicator Boot capacity and comfort. It returns the satisfaction level for this indicator.
* SostenibilidadBMW\_18\_03\_2025.m: This function contains the model presented in the paper, as well as the input data for the BMW 220i Active Tourer (mild HEV). When executed, it returns the results presented in the paper for this vehicle: partial and total sustainability indices. At the environmental level, it employs the Green NCAP indicators.
* SostenibilidadBMW\_18\_03\_2025\_Dincer.m: The same as the previous function, but in this case using environmental values based on the work of Bicer and Dincer (doi:10.1016/j.resconrec.2018.01.036).
* SostenibilidadOpelAstra\_18\_03\_2025.m: The same as function SostenibilidadBMW\_18\_03\_2025.m, but for the Opel/Vauxhall Astra 1.5 CDTI (Diesel).
* SostenibilidadOpelAstra\_18\_03\_2025\_Dincer.m: The same as the previous function, but in this case using environmental values based on the work of Bicer and Dincer (doi:10.1016/j.resconrec.2018.01.036).
* SostenibilidadSmart3\_18\_03\_2025.m: The same as function SostenibilidadBMW\_18\_03\_2025.m, but for the Smart #3 Pro (EV).
* SostenibilidadSmart3\_18\_03\_2025\_Dincer.m: The same as the previous function, but in this case using environmental values based on the work of Bicer and Dincer (doi:10.1016/j.resconrec.2018.01.036).
* SostenibilidadToyotaYaris\_18\_03\_2025.m: The same as function SostenibilidadBMW\_18\_03\_2025.m, but for the Toyota Yaris Cross (HEV).
* SostenibilidadToyotaYaris\_18\_03\_2025\_Dincer.m: The same as the previous function, but in this case using environmental values based on the work of Bicer and Dincer (doi:10.1016/j.resconrec.2018.01.036).



The first three functions are called by the other MATLAB functions.



## Folder: Case 2

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



## Folder: Excel model

This folder contains a spreadsheet with a deterministic version of the model presented in the paper. The weights and value functions are consistent with those described in the article. This spreadsheet is particularly intended for users who wish to apply the model to determine the partial and total sustainability indices of other real market vehicles, different from those included in Case Study 1.



Although the spreadsheet is written in English, it was created using a Spanish-language version of Excel. If opened with a version of the software in a different language, users may need to translate some of the functions in order to use the model correctly.



## How to cite

If you use this model or any part of this repository in your work, please cite the following publication:



Cartelle Barros, J.J., Cardenal, J., de la Cruz López, M.P., del Caño Gochi, A. (2025). New probabilistic multi-criteria model for assessing the integral sustainability of private cars with different propulsion systems. Journal of Cleaner Production, Volume X, Article number Y. https://doi.org/xx.xxxx/xxxxxxxx.



This paper is currently under review. The reviewers have requested that the model be uploaded to a repository to make it accessible.





