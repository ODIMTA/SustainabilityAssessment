# Excel Simulation Model

This folder contains an Excel template with seven spreadsheets designed to reproduce the results presented in the research article: "A New Probabilistic Multi-Criteria Model for Assessing the Integral Sustainability of Private Cars with Different Propulsion Systems" by Cartelle Barros, J.J., Cardenal, J., de la Cruz López, M.P., and del Caño Gochi, A. (2025), currently under review for publication in the Journal of Cleaner Production.

---
## 📦 Folder content

- `SustPrivateCars.xltx`: Excel template for assessing the sustainability of an individual car model.
- `SustPrivateCars.xlsx`: Excel workbook for assessing the sustainability of an individual car model (deprecated).
- `LICENSE`: MIT License for open use and modification.
- `CITATION.cff`: Citation metadata for academic referencing.

## 📦 Template content and instructions

The template `SustPrivateCars.xltx` contains seven tabs (spreadsheets):
- `0-Instructions`: Guidelines for using the Excel tool to assess the sustainability of a specific car model.
- `1-Weights-Alt1-GreenNCAP`: Allows users to define weights for criteria, requirements, and indices when evaluating the environmental dimension based on GreenNCAP ratings. Preconfigured with the weights proposed in the research article, but fully customizable.
- `2-Weights-Alt2-Ecoind99`: Similar to the previous sheet, but based on EcoIndicator 99 methodology. Also preconfigured and editable.
- `3a-ValueFunctionsParameters`: Enables definition of parameters for the satisfaction level functions associated with each index. Preloaded with function types and parameter values from the article, with full flexibility for user adjustments.
- `3b-ValueFunctionsShape`: Allows users to visualize the geometry of a continuous value function. Users can define the function parameters and view the resulting plot, which includes optional markers to indicate satisfaction levels at specific indicator values. The sheet is preloaded with the function type and parameters for indicator S1, as presented in the article, but remains fully editable.
- `4-Model-Alt1-GreenNCAP`: Input sheet for values P<sub>j,x</sub> for each index, used to assess a car model's sustainability under the GreenNCAP-based environmental evaluation. Prepopulated with data for the BMW 220i Active Tourer (mild HEV), as presented in the article.
- `5-Model-Alt2-Ecoind99`: Same structure as the previous sheet, but based on EcoIndicator 99. Also prepopulated with data for the BMW 220i Active Tourer and customizable for other models.

## 📦 Workbook content and instructions

The workbook `SustPrivateCars.xlsx` contains six spreadsheets:
- `0-Instructions`: Guidelines for using the Excel tool to assess the sustainability of a specific car model.
- `1-Weights-Alt1-GreenNCAP`: Allows users to define weights for criteria, requirements, and indices when evaluating the environmental dimension based on GreenNCAP ratings. Preconfigured with the weights proposed in the research article, but fully customizable.
- `2-Weights-Alt2-Ecoind99`: Similar to the previous sheet, but based on EcoIndicator 99 methodology. Also preconfigured and editable.
- `3-ValueFunctions`: Enables definition of parameters for the satisfaction level functions associated with each index. Preloaded with function types and parameter values from the article, with full flexibility for user adjustments.
- `4-Model-Alt1-GreenNCAP`: Input sheet for values P<sub>j,x</sub> for each index, used to assess a car model's sustainability under the GreenNCAP-based environmental evaluation. Prepopulated with data for the BMW 220i Active Tourer (mild HEV), as presented in the article.
- `5-Model-Alt2-Ecoind99`: Same structure as the previous sheet, but based on EcoIndicator 99. Also prepopulated with data for the BMW 220i Active Tourer and customizable for other models.

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
