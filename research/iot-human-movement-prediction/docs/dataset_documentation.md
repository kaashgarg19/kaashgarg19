# Dataset Documentation

## Dataset role

The dataset is the empirical foundation for the MSc project and its current research extension. It was obtained from Kaggle and is therefore documented as an external dataset rather than as data collected by the researcher.

## Audited structure

| Item | Audited value |
|---|---|
| Observations | 405,184 |
| Columns | 9 |
| Target | `motion` |
| Sensor features | `co`, `humidity`, `light`, `lpg`, `smoke`, `temp` |
| Positive movement events | 482 |
| Positive prevalence | ~0.119% |
| Devices | 3 |
| Observation period | ~8 days |
| Timestamp | Unix seconds |
| Unique timestamps | 405,171 |
| Duplicate timestamp values | 13 |

## Interpretation

The target is highly imbalanced: only 482 of 405,184 observations are positive movement events. Consequently, headline accuracy can be misleading. The research emphasises precision, recall, F1-score, average precision/PR-AUC and threshold-dependent behaviour.

## Timestamp note

The raw `ts` field has been verified as Unix seconds for the current research record. An earlier nanosecond interpretation was rejected. The 13 duplicate timestamp values are retained because simultaneous readings across multiple devices can be plausible.

## Provenance and licensing

**Source:** Kaggle (external dataset).  
**Redistribution:** Raw data should not be committed to this repository unless the original dataset licence explicitly permits redistribution.

Before publication, record the exact Kaggle dataset URL, dataset author, licence and retrieval date here. The repository should provide source instructions rather than silently redistributing a third-party dataset where permission is unclear.

## Data-quality checks

The validation stage should confirm:

- row and column counts
- data types
- missing values
- duplicates
- timestamp range
- device identifiers
- target prevalence
- invalid sensor values
- target leakage risks
- consistency with the dataset used for the documented experiments

## Reproducibility

The dataset itself is not treated as immutable merely because it was used in the MSc work. Any changed or re-downloaded version must be audited and its provenance recorded before results are considered reproducible.
