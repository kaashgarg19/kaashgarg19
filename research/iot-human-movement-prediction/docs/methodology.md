# Methodology

## 1. Data understanding

The first stage is to establish the dataset structure, target variable, sensor variables, time information and device identifiers where available.

## 2. Data validation

Before modelling, the dataset will be checked for:

- Missing values
- Duplicate observations
- Invalid or impossible values
- Data types
- Class distribution
- Timestamp coverage
- Device coverage
- Potential target leakage

## 3. Preprocessing

Preprocessing will be performed using reproducible Python workflows. Any transformations learned from data will be fitted on the training portion only when required to prevent information leakage.

## 4. Baseline evaluation

The first experiment will reproduce the appropriate baseline setup from the MSc work as closely as possible. This creates a reference point before introducing stronger evaluation designs.

## 5. Model comparison

The planned models are Logistic Regression, Random Forest and Histogram-based Gradient Boosting. Model performance will be compared using metrics suitable for imbalanced classification.

## 6. Robust evaluation

### Temporal generalisation

Training and testing will be separated chronologically where timestamps permit. The purpose is to estimate performance on future observations rather than randomly mixed observations.

### Device-level generalisation

Where reliable device identifiers exist, selected devices may be held out from training to assess cross-device generalisation.

### Feature ablation

Features or feature groups will be removed systematically to investigate their contribution to predictive performance.

### Threshold sensitivity

Performance will be examined across decision thresholds rather than assuming that the default classification threshold is optimal.

## 7. Reporting

Results will report the experimental split, preprocessing, model configuration, class distribution and evaluation metrics. Conclusions will distinguish observed results from hypotheses and limitations.
