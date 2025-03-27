# DDA4210-Causal-Inference
A Machine Learning course project studied on causal inference
---
## Bullet Points:
- Preprocessed and cleaned real-world environmental time-series data using Python (`Pandas`, `Seaborn`), **removing high-NaN features** and **visualizing correlations** to prepare for robust causal modeling.

- Applied **CGNN** from `Causal Discovery Toolbox` to uncover complex causal relationships among water quality features, identifying confounding effects and highlighting the limitations of simpler algorithms like the PC method.

- Quantified and validated the *causal effect* of temperature on dissolved oxygen using DoWhy, estimating a **~0.086 mg/L** drop per 1°C increase and verifying results with statistical refuters for robustness.

- Developed a **Toda-Yamamoto VAR model** in `R` to capture time-lagged causality in non-stationary data, identifying strong causal links from temperature to both pH and dissolved oxygen with high statistical significance (**p < 0.01**).

- Synthesized insights from multiple causal inference methods to reach consistent, data-backed conclusions, aligning empirical findings with prior environmental studies and demonstrating methodological rigor.
