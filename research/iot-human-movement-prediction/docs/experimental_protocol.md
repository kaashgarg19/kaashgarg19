# Experimental Protocol

## Objective

Evaluate human-movement prediction models under both conventional and distribution-shift-aware evaluation settings.

## Experiment sequence

| ID | Experiment | Purpose |
|---|---|---|
| E01 | Dataset validation | Confirm structure, target, missingness and data quality |
| E02 | Class distribution | Quantify movement-event imbalance |
| E03 | Baseline reproduction | Establish a reference result from the MSc work |
| E04 | Logistic Regression | Interpretable baseline classifier |
| E05 | Random Forest | Non-linear ensemble baseline |
| E06 | Histogram Gradient Boosting | Additional non-linear model |
| E07 | Temporal hold-out | Test performance on later observations |
| E08 | Unseen-device hold-out | Test cross-device generalisation where possible |
| E09 | Feature ablation | Measure contribution of feature groups |
| E10 | Threshold sensitivity | Examine precision/recall trade-offs |

## Required reporting for each experiment

- Dataset version/source
- Number of observations
- Features used
- Target definition
- Train/test strategy
- Preprocessing
- Model and parameters
- Random seed, where applicable
- Evaluation metrics
- Main result
- Interpretation
- Limitations

## Reproducibility rule

No final research claim should be made from a result that cannot be traced to a documented dataset, preprocessing pipeline, split strategy and model configuration.

## Important caution

The project must not assume that temporal or device-level distribution shift exists until the dataset is inspected and the relevant variables are verified.
