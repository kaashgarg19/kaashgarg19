# Original MSc Implementation — Verified Reconstruction

## Purpose

This document connects the GitHub research project to the actual MSc dissertation implementation. The source evidence was recovered from the dissertation appendix/code section in `AmanGuptaDissertation_20101021(1).docx`.

The original MSc project was **not** the same as the later robustness study. The original work established the human-movement prediction problem, performed exploratory IoT telemetry analysis, created a balanced modelling subset, and compared multiple classifiers.

## 1. Original research aim

The MSc research aimed to predict, identify, examine and evaluate human movement near IoT devices using machine-learning methods and Python. The stated objectives included assessing environmental sensor telemetry, preprocessing sensor data from different devices/locations, applying data-mining methods, visualising telemetry, and evaluating data models. fileciteturn46file6

## 2. Original dataset handling

The dissertation code loaded `iotdata.csv` with pandas and identified three IoT devices. The recorded dataset contained 405,184 observations and nine columns: `ts`, `device`, `co`, `humidity`, `light`, `lpg`, `motion`, `smoke`, and `temp`. The code reported no null values. fileciteturn51file0

The original code also converted the Unix timestamp into hour, minute, second and microsecond fields, factorised the device identifier, and label-encoded the Boolean `light` and `motion` variables. fileciteturn51file0

## 3. Original class-balancing strategy

The original dataset contained 482 positive `motion=True` observations and 404,702 negative observations. The dissertation therefore constructed a balanced modelling subset by sampling 482 negative observations, then splitting both classes 75/25 into training and test partitions. This produced 722 training observations and 242 test observations, with 361 positives in each partition. fileciteturn51file0

This is preserved here as **historical MSc methodology**, not recommended as the evaluation protocol for the research extension.

## 4. Original modelling workflow

The dissertation imported and evaluated:

- Logistic Regression
- K-Nearest Neighbours
- Random Forest
- Decision Tree
- XGBoost
- Gaussian Naive Bayes
- Support Vector Classifier
- Gradient Boosting

It also used cross-validation and GridSearchCV for model tuning. fileciteturn47file0turn47file1

The original Random Forest implementation used `RandomForestClassifier()` and reported a test accuracy of approximately 81.40% before the later tuning stage. The tuned model-comparison table reported Random Forest at approximately 81.82% accuracy, followed by XGBoost at approximately 80.17% and Logistic Regression/Decision Tree/Gradient Boosting at approximately 78.93%. fileciteturn47file0turn47file1

## 5. Important methodological distinction

The original MSc implementation used a small balanced subset because the movement event was extremely rare. It also applied standardisation before the historical model evaluation and performed cross-validation on the full feature matrix. These choices are retained for historical traceability but are **not treated as the final research protocol**.

The research extension instead uses the full dataset and evaluates rare-event prediction under controlled random, chronological and device-level conditions. It prioritises precision-recall behaviour, average precision, recall, F1 and uncertainty rather than presenting accuracy as the headline result. The later protocol explicitly protects the final test data from threshold/model-selection decisions. fileciteturn30file0

## 6. MSc → research extension bridge

```text
MSc 2021
Environmental IoT telemetry
        ↓
Exploratory analysis
        ↓
Human-movement classification
        ↓
Multiple ML classifiers
        ↓
Random Forest / tuned model comparison
        ↓
        ┌────────────────────────────────────┐
        │ Research extension                 │
        ↓                                    │
Full rare-event dataset                     │
        ↓                                    │
Controlled random evaluation                │
        ↓                                    │
Chronological evaluation                    │
        ↓                                    │
Unseen-device evaluation                    │
        ↓                                    │
Feature ablation + thresholds + uncertainty │
        ↓                                    │
Robustness/reliability research             │
        └────────────────────────────────────┘
```

## 7. Why this strengthens the research portfolio

The GitHub project can now demonstrate a continuous research trajectory rather than an unrelated new project:

**Original MSc contribution:** establish and implement environmental-IoT human-movement prediction.

**Research extension:** investigate whether that predictive capability remains reliable under extreme imbalance, temporal shift, device variation and threshold changes.

This distinction is important for supervisor outreach because it shows that the current research direction grows directly from an authentic MSc project while adding a clearly defined methodological question.
