# DDA4210-Causal-Inference
A Machine Learning course project studied on causal inference
---
## Bullet Points:
- Investigated causal relationships in Hong Kong sea water quality data (2019–2021) by designing a full pipeline to clean, analyze, and model the data using Python, resulting in a foundational dataset ready for advanced causal inference.

- Cleaned and preprocessed raw environmental data by removing attributes with excessive missing values and resolving string-based anomalies, ensuring the dataset's integrity for modeling.

- Created visualizations including histograms, box plots, heatmaps, and trend graphs using Seaborn to explore feature distributions and relationships, which guided the selection of relevant causal variables like Temperature and Dissolved Oxygen.

- Applied the PC algorithm via CDT for causal discovery but observed undirected results; after standardizing data and reassessing, switched to CGNN (neural-network-based) within CDT, leading to the identification of potential causal relationships among key features.

- Re-ran the CDT model on a reduced subset of four features to test robustness and found the disappearance of direct temperature-to-oxygen causality, indicating the influence of confounding variables and data sensitivity.

- Built a causal graph using DoWhy and identified the quantitative effect of temperature on dissolved oxygen, estimating a drop of approximately 0.086 mg/L for each 1°C increase in temperature.

- Validated the identified causal relationship using statistical refuters in DoWhy, including random confounder injection and data subset testing, with high p-values confirming the robustness of the result.

- Developed a time-series model using the Toda-Yamamoto VAR method, accounting for integration and cointegration in the data, and selected optimal lags using multiple statistical criteria to fit a stable model.

- Detected significant Granger causality from temperature to dissolved oxygen and pH (both with p-values < 0.01), strengthening the evidence for direct environmental causal effects.

- Compared findings across three modeling approaches—CDT, DoWhy, and VAR—to triangulate insights and draw a consistent conclusion about the temperature-dissolved oxygen relationship.

- Anchored results in prior domain research by connecting findings to similar studies in agricultural regions, reinforcing that land use patterns likely mediate consistent causal structures across locations.

- Acknowledged the limitations of monthly sampling frequency and proposed future directions involving higher-frequency data and expanded model comparisons to improve the robustness and relevance of environmental causal inference.
