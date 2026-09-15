# Robust Human Movement Prediction from Environmental IoT Sensors

## Overview

This repository documents the development of a research extension of my MSc dissertation, **Intelligent System to Predict Human Movement near IoT Devices**.

The project investigates how reliably machine-learning models can predict human-movement events from environmental IoT sensor data, with particular attention to class imbalance, temporal generalisation and device-level distribution shift.

## Research direction

The work is being developed as a reproducible research study rather than as a single model-comparison exercise.

### Core questions

1. How accurately can human movement be predicted from environmental IoT sensor measurements?
2. How does performance change when evaluation is performed on later time periods rather than randomly sampled observations?
3. How well do models generalise to IoT devices that were not represented in training data?
4. Which sensor features contribute most to predictive performance?
5. How sensitive are conclusions to class imbalance and the decision threshold?

## Models

The experimental plan includes:

- Logistic Regression
- Random Forest
- Histogram-based Gradient Boosting

Models will be evaluated using metrics appropriate for imbalanced classification, including precision, recall, F1-score, ROC-AUC and PR-AUC where applicable. Accuracy will not be treated as the primary metric when class imbalance makes it misleading.

## Experimental workflow

```text
Dataset
   ↓
Data validation & provenance
   ↓
Cleaning / preprocessing
   ↓
Baseline reproduction
   ↓
Model comparison
   ↓
Random Forest evaluation
   ↓
Temporal evaluation
   ↓
Unseen-device evaluation
   ↓
Feature ablation
   ↓
Threshold sensitivity
   ↓
Results + limitations
```

## Dataset

The dataset used for the research extension was obtained from Kaggle. It is therefore treated as an external dataset, not as data originally collected by me.

Dataset provenance, licensing information, variables and permitted use will be documented in [`docs/dataset_documentation.md`](docs/dataset_documentation.md).

Raw data will not be redistributed here unless redistribution is clearly permitted by the dataset licence.

## Repository structure

```text
.
├── README.md
├── docs/
│   ├── research_questions.md
│   ├── dataset_documentation.md
│   ├── codebook.md
│   ├── methodology.md
│   └── experimental_protocol.md
├── notebooks/
│   ├── 01_data_validation.ipynb
│   ├── 02_baseline_models.ipynb
│   ├── 03_random_forest.ipynb
│   ├── 04_temporal_evaluation.ipynb
│   ├── 05_device_generalisation.ipynb
│   └── 06_feature_ablation.ipynb
├── src/
├── results/
└── figures/
```

The notebook and source-code files will be added after the dataset and original MSc implementation have been checked against the research documentation.

## Relationship to MSc dissertation

This project preserves the original MSc research direction while extending the evaluation beyond the original study. The extension is designed to test whether reported predictive performance remains reliable under more realistic evaluation conditions.

## Reproducibility principles

- Record dataset provenance.
- Keep preprocessing explicit.
- Separate training and evaluation data appropriately.
- Avoid leakage across temporal or device boundaries.
- Record model parameters and random seeds where relevant.
- Report multiple evaluation metrics.
- Preserve intermediate results and experiment configurations.
- State limitations and unresolved questions clearly.

## Status

**Stage: Research portfolio build / experimental validation in progress.**

This repository will be updated incrementally as experiments are reproduced, checked and extended.
