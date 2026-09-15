# Results

This directory is reserved for **verified canonical result artifacts**.

Expected research outputs:

- `MASTER_RANDOM_VS_TEMPORAL_RESULTS.csv`
- `TEMPORAL_MODEL_RESULTS.csv`
- `UNSEEN_DEVICE_RESULTS.csv`
- `FEATURE_ABLATION_RESULTS.csv`
- `THRESHOLD_SENSITIVITY_RESULTS.csv`
- `TEMPORAL_GAP_SENSITIVITY.csv`
- `TEMPORAL_RECALL_UNCERTAINTY.csv`
- `TEMPORAL_PR_CURVES.csv`
- `TEMPORAL_CALIBRATION.csv`
- `TEMPORAL_THRESHOLD_SNAPSHOTS.csv`
- `MASTER_EXPERIMENT_INDEX.csv`

## Canonical-result rule

Only results generated under the documented protocol should be treated as canonical. Later reruns with changed model configurations must be stored separately and must not silently replace the audited results.

The research audit specifically excludes `FINAL_TEMPORAL_AUDIT_RESULTS.csv` from the canonical record because a later Random Forest configuration conflicted with the approved temporal result.

## Reproducibility

Each result artifact should eventually be accompanied by its experiment ID, dataset hash, code version/commit, model configuration, split protocol and environment metadata.
