# Robust Rare-Event Human Movement Prediction from Environmental IoT Sensors

![Research](https://img.shields.io/badge/Research-Rare--Event%20IoT%20ML-informational) ![Python](https://img.shields.io/badge/Python-Reproducible%20Workflow-informational) ![Status](https://img.shields.io/badge/Status-Active%20Research%20Portfolio-informational)

## Overview

This research repository documents a reproducible extension of my MSc dissertation, **Intelligent System to Predict Human Movement near IoT Devices**.

The study investigates whether machine-learning predictions remain reliable when environmental IoT data are extremely imbalanced and when evaluation conditions change across time and sensing devices.

## MSc foundation — connected to the original work

The GitHub project is directly connected to the original MSc implementation recovered from the dissertation appendix. The original work loaded the IoT telemetry dataset, checked its structure and missing values, explored environmental variables, transformed timestamp/device information, created a balanced modelling subset, and compared multiple classification algorithms including Logistic Regression, KNN, Random Forest, Decision Tree, XGBoost, Gaussian NB, SVC and Gradient Boosting. The dissertation also used cross-validation and hyperparameter search.

See [`docs/msc_original_implementation.md`](docs/msc_original_implementation.md), [`src/msc_original.py`](src/msc_original.py), and [`docs/msc_results.md`](docs/msc_results.md).

The historical MSc workflow is preserved for provenance. It is **not** silently presented as the later robustness methodology.

## Research question

**How reliably can machine-learning models predict human movement from environmental IoT sensor data when the data distribution changes across time and sensing devices?**

## Research boundary

The MSc foundation established the human-movement prediction problem using environmental IoT telemetry. The current extension adds a reliability-focused evaluation layer: chronological testing, unseen-device testing, feature ablation, threshold sensitivity and uncertainty analysis.

The later experiments are explicitly presented as an extension and are not described as work completed in the original MSc dissertation.

## MSc outputs

The repository now includes a verified historical MSc results record and lightweight reconstructed figures:

- [`results/msc_original_results.csv`](results/msc_original_results.csv) — reported model-comparison accuracies.
- [`figures/msc_model_accuracy.svg`](figures/msc_model_accuracy.svg) — reconstructed accuracy comparison.
- [`figures/msc_research_bridge.svg`](figures/msc_research_bridge.svg) — MSc-to-current-research bridge.
- [`notebooks/02_msc_original_analysis.ipynb`](notebooks/02_msc_original_analysis.ipynb) — reproducible MSc foundation notebook.
- [`docs/dissertation.md`](docs/dissertation.md) — dissertation landing page.

The figures are labelled **reconstructed** rather than represented as the original dissertation artwork. The original dissertation contains the source screenshots.

## Dataset snapshot

- 405,184 rows
- 9 columns
- 6 environmental sensor features
- 3 IoT devices
- 482 positive movement events
- ~0.119% positive prevalence
- approximately 8 days of observations
- timestamp interpreted as Unix seconds

The dataset was obtained from Kaggle. The raw file is intentionally not redistributed here until its exact source, attribution and licence have been verified.

See [`docs/codebook.md`](docs/codebook.md) and [`docs/dataset_documentation.md`](docs/dataset_documentation.md).

## Models

Canonical research-extension model families:

- Logistic Regression
- Random Forest
- Histogram Gradient Boosting

The evaluation prioritises average precision, precision, recall and F1 because the positive class is extremely rare. Balanced accuracy is secondary; accuracy alone is not a meaningful headline result for this dataset.

## Repository structure

```text
research/iot-human-movement-prediction/
├── README.md
├── requirements.txt
├── data/
│   └── raw/
│       └── README.md
├── docs/
│   ├── research_questions.md
│   ├── dataset_documentation.md
│   ├── codebook.md
│   ├── methodology.md
│   ├── experimental_protocol.md
│   ├── msc_foundation.md
│   ├── msc_original_implementation.md
│   ├── msc_results.md
│   └── dissertation.md
├── figures/
│   ├── README.md
│   ├── msc_model_accuracy.svg
│   └── msc_research_bridge.svg
├── notebooks/
│   ├── 01_data_validation.ipynb
│   ├── 02_msc_original_analysis.ipynb
│   ├── 03_baseline_models.ipynb
│   ├── 04_temporal_evaluation.ipynb
│   └── 05_robustness_analysis.ipynb
├── src/
│   ├── __init__.py
│   ├── data.py
│   ├── splits.py
│   ├── models.py
│   ├── evaluation.py
│   └── msc_original.py
└── results/
    ├── README.md
    └── msc_original_results.csv
```

## Notebook roles

1. **01_data_validation** — schema, timestamp, device and imbalance audit.
2. **02_msc_original_analysis** — reproducible reconstruction of the MSc analytical foundation and telemetry visualisation.
3. **03_baseline_models** — controlled random 60/20/20 evaluation.
4. **04_temporal_evaluation** — chronological 60/20/20 evaluation.
5. **05_robustness_analysis** — entry point for unseen-device, feature-ablation, threshold and uncertainty artifacts.

## Canonical experimental record

The audited research record contains completed pilot experiments covering random baselines, temporal evaluation, leave-one-device-out testing, feature ablation, threshold sensitivity, temporal-gap sensitivity, recall uncertainty and PR/calibration diagnostics.

The repository deliberately distinguishes canonical results from later conflicting reruns. In particular, the later `FINAL_TEMPORAL_AUDIT_RESULTS.csv` is excluded from the canonical record because it used a different Random Forest configuration.

## Key evidence

The audited record reports:

- Random-split AP: Logistic Regression 0.003968; HistGradientBoosting 0.009588; Random Forest 0.009638.
- Chronological AP: Logistic Regression 0.004150; HistGradientBoosting 0.004028; Random Forest 0.002801.
- Temporal test set: 92 positive events.
- Random Forest feature importance is led by temperature and humidity in the audited configuration, but these values are predictive evidence rather than causal evidence.

These are dataset-specific pilot findings, not claims of universal model superiority.

## Reproducibility checklist

Before calling the repository fully reproducible, record:

- [ ] Exact dataset URL and owner
- [ ] Dataset licence
- [ ] Retrieval date
- [ ] SHA-256 dataset hash
- [ ] Python version
- [ ] pandas / NumPy / scikit-learn versions
- [ ] Runtime/hardware where relevant
- [x] Split protocol
- [x] Random seed
- [x] Preprocessing rules
- [x] Canonical model configurations
- [x] Threshold-selection rule
- [x] Canonical metrics and experiment inventory

## Status

**MSc-to-research connection:** complete  
**MSc results package:** complete  
**Research foundation:** complete  
**Dataset audit:** complete  
**Core and robustness experiments:** complete in the research record  
**GitHub reproducibility package:** in progress  
**Next:** verify exact dataset provenance/licence/hash and add canonical research-extension CSV/figure outputs.
