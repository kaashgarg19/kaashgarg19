# Human Movement Prediction using IoT Data

A machine-learning project using environmental IoT sensor data to predict human movement.

## About the project

This project started as my MSc dissertation, **Intelligent System to Predict Human Movement near IoT Devices**.

The project uses sensor measurements such as temperature, humidity, light, smoke and gas-related readings to study human movement near IoT devices.

I have kept the original MSc work and later analysis together in this project so the development of the work can be followed clearly.

## What the project includes

- Data exploration and preprocessing
- Machine-learning classification
- Logistic Regression
- Random Forest
- Histogram Gradient Boosting
- Model evaluation
- Temporal evaluation
- Device-level evaluation
- Feature analysis
- Threshold analysis

## Dataset

The working dataset contains:

- 405,184 observations
- 9 columns
- 6 environmental sensor measurements
- 3 IoT devices
- 482 movement events
- About 0.119% positive events
- About 8 days of observations

The dataset was obtained from Kaggle. The raw dataset is not included here while its source and licence information are being checked.

## MSc work

**MSc:** Advanced Computer Science  
**University:** Birmingham City University, UK  
**Result:** Distinction  
**Dissertation:** *Intelligent System to Predict Human Movement near IoT Devices*

The original MSc implementation and reported results are documented in the `docs/` folder.

- [MSc foundation](docs/msc_foundation.md)
- [Original implementation](docs/msc_original_implementation.md)
- [Original MSc results](docs/msc_results.md)

## Repository structure

```text
├── data/        Dataset instructions
├── docs/        Project documentation
├── figures/     Figures
├── notebooks/   Analysis notebooks
├── results/     Results
├── src/         Python code
└── requirements.txt
```

## Notebooks

1. `01_data_validation.ipynb` — dataset checks
2. `02_msc_original_analysis.ipynb` — MSc analysis and results
3. `03_baseline_models.ipynb` — baseline models
4. `04_temporal_evaluation.ipynb` — temporal analysis
5. `05_robustness_analysis.ipynb` — additional analysis

## Results

- [Original MSc model results](results/msc_original_results.csv)
- [Research metrics](results/canonical_research_metrics.csv)

## Note

The additional analysis in this repository extends the original MSc project. It should not be confused with work that was part of the 2021 dissertation.
