# MATLAB Simulation Model - Case 2

This repository contains the MATLAB code and data used to produce *case 2* results in the research article **"New probabilistic multi-criteria model for assessing the integral sustainability of private cars with different propulsion systems"** Cartelle Barros, J.J., Cardenal, J., de la Cruz López, M.P., del Caño Gochi, A. (2025) that is currently is under review for publication in the *Journal of Cleaner Production*


## General description

It consists of a total of 14 MATLAB functions:

* `FVcontinua.m`: It is an auxiliary function associated with the value functions of continuous indicators (MIVES method). It returns the satisfaction level for a given value function (it is the same function as in the Case 1 folder).
* `FVdiscreta2.m`: It is an auxiliary function associated with the value functions of discrete indicators (MIVES method). It returns the satisfaction level for a given value function (it is the same function as in the Case 1 folder).
* `Maletero.m`: It is an auxiliary function associated with the indicator *Boot capacity and comfort (S9)*. It returns the satisfaction level for this indicator. It is the same function as in the Case 1 folder.
* `betaPERT.m`: Function required to generate pseudo-random numbers according to a beta-PERT distribution.
* `CocheCombProbabilistaCorrelacionado_28_03_2025_PERT.m`: This function performs the Monte Carlo simulation for a generic conventional vehicle. It contains the data defined in the paper for this type of vehicle, including the corresponding correlations between indicators. It returns the basic statistical parameters for the partial and total sustainability indices, as well as all the indices obtained during the simulation. It also provides the option to generate graphical representations (cumulative probability curves and frequency histograms). At the environmental level, it employs the Green NCAP indicators.
* `CocheCombProbabilistaCorrelacionado_28_03_2025_PERT_Dincer.m`: The same as the previous function, but in this case using environmental values based on the work of Bicer and Dincer (doi:10.1016/j.resconrec.2018.01.036).
* `CocheElecProbabilistaCorrelacionado_28_03_2025_PERT.m`: The same as function CocheCombProbabilistaCorrelacionado_28_03_2025_PERT, but for a generic EV.
* `CocheElecProbabilistaCorrelacionado_28_03_2025_PERT_DINCER.m`: The same as the previous function, but in this case using environmental values based on the work of Bicer and Dincer (doi:10.1016/j.resconrec.2018.01.036).
* `CocheHEVProbabilistaCorrelacionado_28_03_2025_PERT.m`: The same as function CocheCombProbabilistaCorrelacionado_28_03_2025_PERT, but for a generic HEV.
* `CocheHEVProbabilistaCorrelacionado_28_03_2025_PERT_DINCER.m`: The same as the previous function, but in this case using environmental values based on the work of Bicer and Dincer (doi:10.1016/j.resconrec.2018.01.036).
* `CochePHEVProbabilistaCorrelacionado_28_03_2025_PERT.m`: The same as function CocheCombProbabilistaCorrelacionado_28_03_2025_PERT, but for a generic PHEV.
* `CochePHEVProbabilistaCorrelacionado_28_03_2025_PERT_DINCER.m`: The same as the previous function, but in this case using environmental values based on the work of Bicer and Dincer (doi:10.1016/j.resconrec.2018.01.036).
* `RepresentacionesGraficas_PERT.m`: Function that simultaneously calls functions `CocheCombProbabilistaCorrelacionado_28_03_2025_PERT`, `CocheElecProbabilistaCorrelacionado_28_03_2025_PERT`, `CocheHEVProbabilistaCorrelacionado_28_03_2025_PERT`, and `CochePHEVProbabilistaCorrelacionado_28_03_2025_PERT`, generating graphical representations (cumulative probability curves and frequency histograms), as well as numerical results.
* `RepresentacionesGraficas_PERT_DINCER.m`: The same as the previous function, but in this case using `CocheCombProbabilistaCorrelacionado_28_03_2025_PERT_DINCER`, `CocheElecProbabilistaCorrelacionado_28_03_2025_PERT_DINCER`, `CocheHEVProbabilistaCorrelacionado_28_03_2025_PERT_DINCER`, and `CochePHEVProbabilistaCorrelacionado_28_03_2025_PERT_DINCER`.


## How to cite

If you use this code or model in your research, please cite the following publication:

> Cartelle Barros, J.J., Cardenal, J., de la Cruz López, M.P., del Caño Gochi, A. (2025). *New probabilistic multi-criteria model for assessing the integral sustainability of private cars with different propulsion systems*.

You can also cite this repository directly using the `CITATION.cff` file included in the root directory. GitHub will automatically generate a citation in BibTeX, APA, and other formats via the “Cite this repository” button.


