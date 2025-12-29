# Excel Simulation Model

This folder contains an Excel template with seven spreadsheets designed to reproduce the results presented in the research article: "A New Probabilistic Multi-Criteria Model for Assessing the Integral Sustainability of Private Cars with Different Propulsion Systems" by Cartelle Barros, J.J., Cardenal, J., de la Cruz López, M.P., and del Caño Gochi, A. (2025), currently under review for publication in the Journal of Cleaner Production.

---
## 📦 Folder content

- `SustPrivateCars.xltx`: Excel template for assessing the sustainability of an individual car model.
- `LICENSE`: MIT License for open use and modification.
- `CITATION.cff`: Citation metadata for academic referencing.

## 📦 Template content and instructions

The template `SustPrivateCars.xltx` contains seven tabs (spreadsheets):
- `0-Instructions`: Guidelines for using the Excel tool to assess the sustainability of a specific car model.
- `1-Weights-Alt1-GreenNCAP`: Allows users to define weights for criteria, requirements, and indicators, covering the economic, social and environmental pillars of sustainability. GreenNCAP ratings are employed to evaluate the environmental dimension of sustainability. It is preconfigured with the weights proposed in the research article, but fully customizable.
- `2-Weights-Alt2-Ecoind99`: Similar to the previous sheet, but EcoIndicator 99 assessment is used to evaluate the environmental dimension of sustainability, instead of GreenNCAP ratings. This sheet mirrors the weights that were set up in the previous one (`1-Weights-Alt1-GreenNCAP`), so it should not be modified by the user.
- `3a-ValueFunctionsParameters`: Enables definition of parameters for the satisfaction level functions associated with each indicator. Preloaded with the function parameter employed in the article, with full flexibility for user changes to adjust any of them.
- `3b-ValueFunctionsShape`: Allows users to visualize the geometry of a continuous value function. Users can define the function parameters and view the resulting plot. The sheet is preloaded with the function parameters for indicator S1, as presented in the article, but remains fully editable.
- `4-Model-Alt1-GreenNCAP`: Input sheet for values P<sub>j,x</sub> for each indicator, used to assess a car model's sustainability under the GreenNCAP-based environmental evaluation. Prepopulated with data for the BMW 220i Active Tourer (mild HEV), as presented in the article.
- `5-Model-Alt2-Ecoind99`: Same structure as the previous sheet, but based on EcoIndicator 99 assessment, instead of GreenNCAP ratings. Indicator values for the model to be assessed, but those related to environmental dimension, are taken from the previuos sheet `4-Model-Alt1-GreenNCAP`. User should fill Eco-indicator 99 value in milli-points (mPt) to obtain the new environmental and total sustainability indices of the vehicle under study.

---

## 📚 How to Cite This Work

If you use this code or model in your research, please cite the following publication:

> Cartelle Barros, J.J., Cardenal, J., de la Cruz López, M.P., del Caño Gochi, A. (2026). *New probabilistic multi-criteria model for assessing the integral sustainability of private cars with different propulsion systems*.

You can also cite this repository directly using the `CITATION.cff` file included in the root directory. GitHub will automatically generate a citation in BibTeX, APA, and other formats via the “Cite this repository” button.

---

## 🔍 Related Publication

This repository accompanies the research article submited to the *Journal of Cleaner Production*, which presents a probabilistic multi-criteria decision model applied to private car sustainability assessment. The code implements the MIVES methodology and integrates data from Green NCAP and other sources.

---

## 🛠 License

This project is licensed under the MIT License — see the [LICENSE](https://github.com/ODIMTA/SustainabilityAssessment/blob/main/LICENSE) file for details.
