# Dataset Codebook

## 1. Dataset identity

**Project:** Robust Rare-Event Human Movement Prediction from Environmental IoT Sensors

**Original MSc foundation:** Intelligent System to Predict Human Movement near IoT Devices

**Source:** Kaggle dataset used in the MSc work. The raw dataset is intentionally **not included** in this repository until its exact source URL, author and licence have been verified.

**Audited shape:** 405,184 rows × 9 columns.

**Observation period:** approximately 13 April 2021 to 20 April 2021 UTC (~8 days).

**Target:** `motion`.

**Positive events:** 482.

**Positive prevalence:** approximately 0.11896% (~0.119%).

**Devices:** 3.

## 2. Column-level codebook

| Column | Role | Expected type | Description | Research use | Notes |
|---|---|---|---|---|---|
| `ts` | Identifier/time | integer-like | Unix timestamp in seconds | Chronological ordering and temporal splits | Treat as seconds; do not reinterpret as nanoseconds. |
| `device` | Group identifier | categorical/integer-like | IoT device identifier | Device-level distribution-shift and leave-one-device-out evaluation | Keep separate from sensor features. |
| `co` | Sensor feature | numeric | Carbon monoxide reading | Predictive feature | Environmental telemetry; not treated as causal. |
| `humidity` | Sensor feature | numeric | Relative humidity reading | Predictive feature | Environmental telemetry; not treated as causal. |
| `light` | Sensor feature | numeric | Light-level reading | Predictive feature | Environmental telemetry; not treated as causal. |
| `lpg` | Sensor feature | numeric | Liquefied petroleum gas (LPG) reading | Predictive feature | Environmental telemetry; not treated as causal. |
| `smoke` | Sensor feature | numeric | Smoke reading | Predictive feature | Environmental telemetry; not treated as causal. |
| `temp` | Sensor feature | numeric | Temperature reading | Predictive feature | Environmental telemetry; not treated as causal. |
| `motion` | Binary target | binary/integer | Indicator of movement/activity near the sensing environment | Classification target | Positive class is rare; use precision-recall metrics rather than accuracy alone. |

## 3. Important data-quality decisions

- The dataset contains 405,184 observations and 9 columns.
- There are 13 duplicated timestamp values, but duplicated timestamps are retained because simultaneous readings from different devices are plausible.
- Timestamp interpretation is Unix seconds.
- The target is extremely imbalanced: 482 positives out of 405,184 observations.
- Accuracy is therefore not an appropriate headline metric.
- The primary evaluation measures are average precision, precision, recall and F1; balanced accuracy is secondary.
- Missing-value handling must be fitted on training data only when preprocessing is required.
- Random and chronological evaluations must remain explicitly separated.

## 4. Feature interpretation policy

Sensor measurements are treated as predictive inputs. Feature importance or ablation results describe model behaviour and **must not be interpreted as evidence that a sensor variable causes human movement**.

## 5. Reproducibility requirements

Before publication of the repository, record:

1. Exact Kaggle dataset URL.
2. Dataset author/owner.
3. Dataset licence.
4. Retrieval date.
5. SHA-256 hash of the local raw dataset.
6. Python version.
7. pandas, NumPy and scikit-learn versions.
8. Runtime/hardware where relevant.

## 6. Data access rule

Do not commit the raw Kaggle dataset to GitHub unless the dataset licence explicitly permits redistribution. The repository should instead contain documentation and a local path convention such as `data/raw/iotdata.csv`.
