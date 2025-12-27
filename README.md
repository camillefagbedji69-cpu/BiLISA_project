# Ecosystem-Nexus: Spatial Interaction of Carbon & Water Services

## 📌 Context & Overview
Understanding the spatial overlap between carbon sequestration and water yield is vital for multi-objective landscape management. This project integrates outputs from **InVEST models** to analyze the spatial dependencies and trade-offs between these two critical ecosystem services. By applying **Bivariate Spatial Autocorrelation**, we identify where conservation efforts for carbon might conflict with or support water resource availability.

## 🎯 Objectives
* **Service Mapping:** Spatially quantifying total carbon stocks and annual water volumes per sub-basin.
* **Spatial Autocorrelation:** Measuring univariate and bivariate **Moran’s I** to detect spatial patterns.
* **Cluster Detection:** Identifying significant hotspots and coldspots using **LISA (Local Indicators of Spatial Association)**.
* **Predictive Modeling:** Quantifying environmental drivers of water volume through high-confidence linear regression ($R^2 = 0.94$).

## 🛠️ Tech Stack & Methodology
* **Language/Environment:** `R` & `GeoDa`.
* **Geospatial Processing:** `InVEST Water Yield`, `InVEST Carbon Storage`.
* **Spatial Statistics:** Univariate/Bivariate Moran's I, LISA Clusters.
* **Statistical Modeling:** Linear Regression with Multicollinearity diagnostics (VIF).



### Analytical Workflow:
1. **Univariate Analysis:** Testing the spatial structure of individual services (Carbon vs. Water).
2. **Bivariate Analysis:** Examining the spatial correlation between Carbon density and Water Yield.
3. **Environmental Modeling:** Regression of water volume against climatic (Precipitation, PET, AET) and structural (Area) variables.

## 🚀 Key Results
* **Spatial Structures:** Water yield shows clear spatial clustering aligned with topography, while carbon stocks appear more fragmented across the study area.
* **The Carbon-Water Trade-off:** Regression analysis confirms that **Actual Evapotranspiration (AET)** negatively impacts water availability, highlighting a biological trade-off: high-biomass (carbon-rich) areas consume more water.
* **High-Confidence Modeling:** Developed a robust model ($R^2 = 0.945$, VIF < 1.1) proving that sub-basin area and precipitation are the primary drivers of water volume.
* **LISA Diagnostics:** Identified rare but critical HL/LH (High-Low) zones, pointing to areas where reforesting for carbon might significantly reduce downstream water availability.



## 🔮 Perspectives for Improvement
* **Advanced Spatial Modeling:** Implementing **SAR (Spatial Autoregressive)** or **SEM (Spatial Error Models)** to further refine the regression results.
* **Temporal Dynamics:** Analyzing the carbon-water relationship over a 20-year time series to detect climate-driven shifts.
* **Targeted Restoration:** Using HL/LH clusters to pinpoint strategic locations for "Water-Smart" reforestation projects.

---
*Quantifying the delicate balance between climate mitigation and water security.*
