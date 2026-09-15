# Human Movement Prediction using IoT Data

## About this project

This is my main research project. It started from my MSc dissertation, **Intelligent System to Predict Human Movement near IoT Devices**.

The original MSc work used environmental sensor data and machine learning to predict human movement. I am now continuing that work and looking at a more practical question:

> **How reliable are these predictions when the data changes over time or between IoT devices?**

This repository keeps my original MSc work separate from the newer research work.

## 🔬 What I am working on

- Human movement prediction
- IoT sensor data
- Machine learning
- Very imbalanced data
- Prediction over time
- Testing models on different devices
- Feature analysis
- Model thresholds and evaluation

## 🎓 MSc starting point

**Degree:** MSc Advanced Computer Science  
**University:** Birmingham City University, UK  
**Result:** Distinction  
**Dissertation:** *Intelligent System to Predict Human Movement near IoT Devices*

The original project compared several machine-learning models. The historical results are documented separately so they are not confused with the newer experiments.

👉 [MSc foundation](docs/msc_foundation.md)  
👉 [Original implementation](docs/msc_original_implementation.md)  
👉 [Original MSc results](docs/msc_results.md)

## 📊 Dataset

The working dataset contains:

- 405,184 observations
- 9 columns
- 6 environmental sensor measurements
- 3 IoT devices
- 482 movement events
- About 0.119% positive events
- About 8 days of observations

The dataset came from Kaggle. The raw file is not included in this repository while its exact source and licence are being verified.

👉 [Dataset documentation](docs/dataset_documentation.md)  
👉 [Codebook](docs/codebook.md)

## 🧪 Research experiments

I am comparing three main model types:

- Logistic Regression
- Random Forest
- Histogram Gradient Boosting

The evaluation uses metrics such as precision, recall, F1 and average precision because movement events are very rare in the dataset.

The research also includes:

- Random vs chronological evaluation
- Unseen-device testing
- Feature ablation
- Threshold sensitivity
- Temporal-gap analysis
- Recall uncertainty
- Precision-recall and calibration analysis

👉 [Research questions](docs/research_questions.md)  
👉 [Experimental protocol](docs/experimental_protocol.md)  
👉 [Reproducibility guide](docs/reproducibility.md)

## 📁 Repository contents

```text
├── data/        Dataset instructions
├── docs/        Research notes and documentation
├── figures/     Research figures
├── notebooks/   Analysis notebooks
├── results/     Verified results
├── src/         Python code
└── requirements.txt
```

## 📓 Notebooks

1. `01_data_validation.ipynb` — checks the dataset.
2. `02_msc_original_analysis.ipynb` — documents the MSc work and historical results.
3. `03_baseline_models.ipynb` — runs the controlled baseline evaluation.
4. `04_temporal_evaluation.ipynb` — tests later observations.
5. `05_robustness_analysis.ipynb` — documents the broader robustness analysis.

## 📌 Important note

The current research is an extension of my MSc work. The later experiments were **not part of the original 2021 dissertation**.

The results are based on one dataset, three devices and a short observation period, so they should be treated as preliminary research evidence rather than universal conclusions.

## 📈 Results

👉 [Original MSc model results](results/msc_original_results.csv)  
👉 [Current research metrics](results/canonical_research_metrics.csv)

## 🔁 Reproducibility

The project is being prepared so another researcher can understand the dataset, preprocessing, model settings, evaluation method and results.

Some final reproducibility information is still being added, including the exact dataset provenance, licence, file hash and environment versions.

## 📚 More information

👉 [Repository audit](docs/repository_audit.md)
