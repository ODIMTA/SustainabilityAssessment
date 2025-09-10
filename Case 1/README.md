# MATLAB Simulation Model - New probabilistic multi-criteria model for assessing the integral sustainability of private cars with different propulsion systems

New probabilistic multi-criteria model for assessing the integral sustainability of private cars with different propulsion systems, Juan José Cartelle Barros, Jesús Cardenal, M. Pilar de la Cruz López, Alfredo del Caño Gochi, Journal of Cleaner Production, 2025.

> https://doi.org/... 

This paper is currently under review. The reviewers have requested that the model be uploaded to a repository to make it accessible.

## 

## Requirements

* MATLAB R2022b or newer.
* Microsoft Excel 2016 or newer.

## 

## General description

This repository contains the MATLAB code to reproduce published results of case 1

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


## How to cite

If you use this model or any part of this repository in your work, please cite the following publication:

Cartelle Barros, J.J., Cardenal, J., de la Cruz López, M.P., del Caño Gochi, A. (2025). New probabilistic multi-criteria model for assessing the integral sustainability of private cars with different propulsion systems. Journal of Cleaner Production, Volume X, Article number Y. https://doi.org/xx.xxxx/xxxxxxxx.

This paper is currently under review. The reviewers have requested that the model be uploaded to a repository to make it accessible.





