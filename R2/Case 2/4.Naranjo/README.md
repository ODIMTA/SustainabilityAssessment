# MATLAB Simulation Model - Case 2 - Puig-Samper Naranjo, et al.

This directory contains the Matlab code used to perform the Monte Carlo simulations that estimate integral and partial sustainability indices for conventional, hybrid, plug-in hybrid, and battery-electric vehicles according to Puig-Samper Naranjo, et al. (doi:10.1016/j.jclepro.2021.125883) environmental sub-model, as they are presented in the second revision of the paper **"New probabilistic multi-criteria model for assessing the integral sustainability of private cars with different propulsion systems"** Cartelle Barros, J.J., Cardenal, J., de la Cruz López, M.P., del Caño Gochi, A. (2026) that is currently is under review for publication in the *Journal of Cleaner Production*.

## General description

It consists of a total of 9 MATLAB functions:

* `FVcontinua.m`: It is an auxiliary function associated with the value functions of continuous indicators (MIVES method). It returns the satisfaction level for a given value function (it is the same function as in the Case 1 folder).
* `FVdiscreta2.m`: It is an auxiliary function associated with the value functions of discrete indicators (MIVES method). It returns the satisfaction level for a given value function (it is the same function as in the Case 1 folder).
* `Maletero.m`: It is an auxiliary function associated with the indicator *Boot capacity and comfort (S9)*. It returns the satisfaction level for this indicator (it is the same function as in the Case 1 folder).
* `betaPERT.m`: Function required to generate pseudo-random numbers according to a beta-PERT distribution.
* `CocheCombProbabilistaCorrelacionado_28_03_2025_PERT_Naranjo.m`: this function performs the Monte Carlo simulation for a generic conventional vehicle. It contains the data defined in the paper for this type of vehicle, including the corresponding correlations between indicators. It returns the basic statistical parameters for the partial and total sustainability indices, as well as all the indices obtained during the simulation. It also provides the option to generate graphical representations (cumulative probability curves and frequency histograms).
* `CocheElecProbabilistaCorrelacionado_28_03_2025_PERT_Naranjo.m`: The same as function `CocheCombProbabilistaCorrelacionado_28_03_2025_PERT_Naranjo`, but for a generic EV.
* `CocheHEVProbabilistaCorrelacionado_28_03_2025_PERT_Naranjo.m`: The same as function `CocheCombProbabilistaCorrelacionado_28_03_2025_PERT_Naranjo`, but for a generic HEV.
* `CochePHEVProbabilistaCorrelacionado_28_03_2025_PERT_Naranjo.m`: The same as function `CocheCombProbabilistaCorrelacionado_28_03_2025_PERT_Naranjo`, but for a generic PHEV.
* `RepresentacionesGraficas_PERT_Naranjo.m`: Function that simultaneously calls functions `CocheCombProbabilistaCorrelacionado_28_03_2025_PERT_Naranjo`, `CocheElecProbabilistaCorrelacionado_28_03_2025_PERT_Naranjo`, `CocheHEVProbabilistaCorrelacionado_28_03_2025_PERT_Naranjo`, and `CochePHEVProbabilistaCorrelacionado_28_03_2025_PERT_Naranjo`, generating graphical representations (cumulative probability curves and frequency histograms), as well as numerical results.

## How to cite

If you use this code or model in your research, please cite the following publication:

> Cartelle Barros, J.J., Cardenal, J., de la Cruz López, M.P., del Caño Gochi, A. (2026). *New probabilistic multi-criteria model for assessing the integral sustainability of private cars with different propulsion systems*.

You can also cite this repository directly using the `CITATION.cff` file included in the root directory. GitHub will automatically generate a citation in BibTeX, APA, and other formats via the “Cite this repository” button.


