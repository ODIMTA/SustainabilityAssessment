# MATLAB Simulation Model - Case 1

This repository contains the MATLAB code and data used to produce *case 1* results in the research article **"New probabilistic multi-criteria model for assessing the integral sustainability of private cars with different propulsion systems"** Cartelle Barros, J.J., Cardenal, J., de la Cruz López, M.P., del Caño Gochi, A. (2025) that is currently is under review for publication in the *Journal of Cleaner Production*

## General description

This repository contains the MATLAB code to reproduce the published results of case 1

It consists of a total of 11 MATLAB functions:

* `FVcontinua.m`: It is an auxiliary function associated with the value functions of continuous indicators (MIVES method). It returns the satisfaction level for a given value function.
* `FVdiscreta2.m`: It is an auxiliary function associated with the value functions of discrete indicators (MIVES method). It returns the satisfaction level for a given value function.
* `Maletero.m`: It is an auxiliary function associated with the indicator Boot capacity and comfort. It returns the satisfaction level for this indicator.
* `SostenibilidadBMW_18_03_2025.m`: This function contains the model presented in the paper, as well as the input data for the BMW 220i Active Tourer (mild HEV). When executed, it returns the results presented in the paper for this vehicle: partial and total sustainability indices. At the environmental level, it employs the Green NCAP indicators.
* `SostenibilidadBMW_18_03_2025_Dincer.m`: The same as the previous function, but in this case using environmental values based on the work of Bicer and Dincer (doi:10.1016/j.resconrec.2018.01.036).
* `SostenibilidadOpelAstra_18_03_2025.m`: The same as function SostenibilidadBMW\_18\_03\_2025.m, but for the Opel/Vauxhall Astra 1.5 CDTI (Diesel).
* `SostenibilidadOpelAstra_18_03_2025_Dincer.m`: The same as the previous function, but in this case using environmental values based on the work of Bicer and Dincer (doi:10.1016/j.resconrec.2018.01.036).
* `SostenibilidadSmart3_18_03_2025.m`: The same as function SostenibilidadBMW\_18\_03\_2025.m, but for the Smart #3 Pro (EV).
* `SostenibilidadSmart3_18_03_2025_Dincer.m`: The same as the previous function, but in this case using environmental values based on the work of Bicer and Dincer (doi:10.1016/j.resconrec.2018.01.036).
* `SostenibilidadToyotaYaris_18_03_2025.m`: The same as function SostenibilidadBMW\_18\_03\_2025.m, but for the Toyota Yaris Cross (HEV).
* `SostenibilidadToyotaYaris_18_03_2025_Dincer.m`: The same as the previous function, but in this case using environmental values based on the work of Bicer and Dincer (doi:10.1016/j.resconrec.2018.01.036).


## How to cite

If you use this code or model in your research, please cite the following publication:

> Cartelle Barros, J.J., Cardenal, J., de la Cruz López, M.P., del Caño Gochi, A. (2025). *New probabilistic multi-criteria model for assessing the integral sustainability of private cars with different propulsion systems*.

You can also cite this repository directly using the `CITATION.cff` file included in the root directory. GitHub will automatically generate a citation in BibTeX, APA, and other formats via the “Cite this repository” button.




