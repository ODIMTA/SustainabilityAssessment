# Excel Simulation Model - New probabilistic multi-criteria model for assessing the integral sustainability of private cars with different propulsion systems

This repository folder contains an Excel Book with six spreadsheets that could serve to reproduce the results outlined in the research article:

**"New probabilistic multi-criteria model for assessing the integral sustainability of private cars with different propulsion systems"**  
Cartelle Barros, J.J., Cardenal, J., de la Cruz López, M.P., del Caño Gochi, A. (2025)  

that is currently is under review for publication in the *Journal of Cleaner Production*

---
## 📦 Folder content

- `SustPrivateCars.xlsx`: Excel book to assess the sustainability of an indiviadual car model.
- `LICENSE`: MIT License for open use and modification.
- `CITATION.cff`: Citation metadata for academic referencing.

## 📦 Book content and instructions

The book contains six spreadsheets:
- `0-Instructions`: instructions to use this Excel tool to assess the sustainability of an indiviadual car model.
- `1-Weights-Alt1-GreenNCAP`: it allows defining the weights of each criteria, requirement and index when evaluating environmental dimension according to GreenNCAP ratings. It has been set up to mirror the weights proposed in the research article. They can be modified to the convenience of any user.
- `2-Weights-Alt2-Ecoind99`: it allows define the weights of each criteria, requirement and index when evaluating environmental dimension according to EcoIndicator 99. It has been set up to mirror the weights proposed in the research article. They can be modified to the convenience of any user.
- `3-ValueFunctions`: it allows defining the parameters that define the satisfaction level function for each index. It has been set up to mirror the function types and parameter values proposed in the research article. They can be modified to the convenience of any user.
- `4-Model-Alt1-GreenNCAP`: it allows defining values Pj,x for every index for the car model to be assessed when the environmental dimension is assessed according to GreenNCAP ratings. It has been set up to mirror values used to assess the sustainability of BMW 220i Active Tourer (mild HEV) as it is done in the research article. They can be modified to assess any other car model.
- `5-Model-Alt2-Ecoind99`: it allows defining values Pj,x for every index for the car model to be assessed when the environmental dimension is assessed according to EcoIndicator 99. It has been set up to mirror values used to assess the sustainability of BMW 220i Active Tourer (mild HEV) as it is done in the research article. They can be modified to assess any other car model.

---

## 📚 How to Cite This Work

If you use this code or model in your research, please cite the following publication:

> Cartelle Barros, J.J., Cardenal, J., de la Cruz López, M.P., del Caño Gochi, A. (2025). *New probabilistic multi-criteria model for assessing the integral sustainability of private cars with different propulsion systems*.

You can also cite this repository directly using the `CITATION.cff` file included in the root directory. GitHub will automatically generate a citation in BibTeX, APA, and other formats via the “Cite this repository” button.

---

## 🔍 Related Publication

This repository accompanies the research article submited to the *Journal of Cleaner Production*, which presents a probabilistic multi-criteria decision model applied to private car sustainability assessment. The code implements the MIVES methodology and integrates data from Green NCAP and other sources.

---

## 🛠 License

This project is licensed under the MIT License — see the [LICENSE](https://github.com/jescarcar/SustainabilityAssessment/blob/main/LICENSE) file for details.
