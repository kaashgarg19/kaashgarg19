# Robust Rare-Event Human Movement Prediction from Environmental IoT Sensors

## Overview

This research repository documents a reproducible extension of my MSc dissertation, **Intelligent System to Predict Human Movement near IoT Devices**.

The study investigates whether machine-learning predictions remain reliable when environmental IoT data are extremely imbalanced and when evaluation conditions change across time and sensing devices.

## Research question

**How reliably can machine-learning models predict human movement from environmental IoT sensor data when the data distribution changes across time and sensing devices?**

## Research boundary

The MSc foundation established the human-movement prediction problem using environmental IoT telemetry. The current extension adds a reliability-focused evaluation layer: chronological testing, unseen-device testing, feature ablation, threshold sensitivity and uncertainty analysis.

The later experiments are explicitly presented as an extension and are not described as work completed in the original MSc dissertation.

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

Canonical model families:

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
│   └── msc_foundation.md
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
│   └── evaluation.py
└── results/
    └── README.md
```

## Notebook roles

1. **01_data_validation** — schema, timestamp, device and imbalance audit.
2. **02_msc_original_analysis** — reproducible reconstruction of the MSc analytical foundation and telemetry visualisation.
3. **03_baseline_models** — controlled random 60/20/20 evaluation.
4. **04_temporal_evaluation** — chronological 60/20/20 evaluation.
5. **05_robustness_analysis** — entry point for unseen-device, feature-ablation, threshold and uncertainty artifacts.

Jupyter notebooks are JSON documents with cells and metadata, so these files are stored as valid notebook-format text rather than opaque binary artifacts. citeturn0search0

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

**Research foundation:** complete  
**Dataset audit:** complete  
**Core and robustness experiments:** complete in the research record  
**GitHub reproducibility package:** being assembled  
**Next:** add verified canonical CSV outputs and the exact dataset provenance/hash information.
