# Reproducibility Guide

## Purpose

This guide explains how to reproduce the research workflow without redistributing the third-party Kaggle dataset.

## 1. Obtain the dataset

Place the authorised copy of the dataset at:

```text
data/raw/iotdata.csv
```

The exact Kaggle URL, dataset owner, licence, retrieval date and SHA-256 hash are still required before the repository can be described as fully reproducible.

## 2. Create the environment

Use Python 3.10 or a compatible newer version supported by the dependency ranges in `requirements.txt`.

From this project directory:

```bash
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

On Windows PowerShell, activate the environment with:

```powershell
.venv\Scripts\Activate.ps1
```

## 3. Validate the dataset first

Run notebook `01_data_validation.ipynb` and confirm:

- 405,184 rows
- 9 columns
- 3 devices
- 482 positive movement events
- approximately 0.119% positive prevalence
- Unix-second timestamps
- 13 duplicated timestamp values

If these checks do not match, stop and audit the dataset version before interpreting any result.

## 4. Historical MSc reconstruction

Run `02_msc_original_analysis.ipynb` to document the MSc foundation and compare the verified historical accuracy values.

`src/msc_original.py` contains a separated historical implementation. It is provided for provenance and should not be confused with the current research protocol.

## 5. Current research evaluation

The current research notebooks use the full rare-event dataset and the canonical model factories in `src/models.py`.

- `03_baseline_models.ipynb` — random stratified 60/20/20 evaluation.
- `04_temporal_evaluation.ipynb` — chronological 60/20/20 evaluation.
- `05_robustness_analysis.ipynb` — index and interpretation rules for robustness artifacts.

Threshold selection must use validation data only. The final test set must remain untouched until evaluation.

## 6. Canonical research metrics currently recorded

The audited research record currently preserves the following average-precision values:

| Split | Logistic Regression | HistGradientBoosting | Random Forest |
|---|---:|---:|---:|
| Random | 0.003968 | 0.009588 | 0.009638 |
| Chronological | 0.004150 | 0.004028 | 0.002801 |

The chronological test partition contains 92 positive events.

These values are dataset-specific pilot evidence. They are not universal performance claims.

## 7. Provenance metadata still required

Before external supervisor outreach or publication, add:

1. Dataset URL
2. Dataset owner/author
3. Dataset licence
4. Retrieval date
5. SHA-256 hash
6. Exact Python version
7. Exact package versions
8. Git commit identifying the analysis
9. Runtime/hardware details if they materially affect results
10. Exact canonical CSV/figure outputs for each experiment

## 8. Interpretation rules

Accuracy must not be used as the main performance claim because the positive event rate is approximately 0.119%. Prioritise average precision, precision, recall and F1, together with threshold behaviour and uncertainty where available.

Feature importance and ablation describe predictive model behaviour; they do not establish causality.

Temporal and device-level findings are preliminary because the current dataset covers only about eight days and three devices.
