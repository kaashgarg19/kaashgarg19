# Flagship Repository Audit

**Audit scope:** `research/iot-human-movement-prediction/` on the `main` branch.

## Overall assessment

The repository is now a strong **research portfolio foundation**, but it is not yet a fully reproducible research package. The main missing pieces are dataset provenance, exact environment capture and the canonical research-extension result artifacts.

## File-by-file status

| Area | Status | Audit finding |
|---|---|---|
| `README.md` | PASS | Clear research question, MSc-to-extension boundary and current status. |
| `docs/research_questions.md` | PASS | Primary and secondary questions are aligned with the proposed research direction. |
| `docs/msc_foundation.md` | PASS | Correctly separates MSc foundation from later extension. |
| `docs/msc_original_implementation.md` | PASS | Documents recovered historical implementation. |
| `docs/msc_results.md` | PASS | Historical accuracy table is clearly labelled and separated. |
| `docs/dissertation.md` | PASS | Uses a safe landing page rather than publishing private academic records. |
| `docs/codebook.md` | PASS WITH FOLLOW-UP | Good field definitions and imbalance policy; exact dataset provenance still missing. |
| `docs/dataset_documentation.md` | PASS WITH FOLLOW-UP | Dataset audit is documented; source URL/licence/hash still missing. |
| `docs/methodology.md` | PASS | Now reflects the completed pilot evidence and current evaluation protocol. |
| `docs/experimental_protocol.md` | PASS WITH FOLLOW-UP | Core protocol is documented and expanded to E01–E14; final artifact traceability is still pending. |
| `docs/reproducibility.md` | PASS WITH FOLLOW-UP | Provides setup, dataset path, execution order and current canonical metrics; exact environment/provenance still pending. |
| `notebooks/01_data_validation.ipynb` | PASS | Correct first-step validation notebook; requires local dataset. |
| `notebooks/02_msc_original_analysis.ipynb` | PASS WITH FOLLOW-UP | Historical reconstruction is clearly labelled; it does not claim to recreate every original plotting cell. |
| `notebooks/03_baseline_models.ipynb` | PASS WITH FOLLOW-UP | Implements the documented random split and validation-only threshold selection; saved detailed result artifact still pending. |
| `notebooks/04_temporal_evaluation.ipynb` | PASS WITH FOLLOW-UP | Implements chronological evaluation; saved detailed result artifact still pending. |
| `notebooks/05_robustness_analysis.ipynb` | PASS WITH FOLLOW-UP | Stale missing-file reference was removed; the notebook now accurately distinguishes the committed compact metrics from the broader research record. |
| `src/data.py` | PASS | Clean loading and validation utilities. |
| `src/splits.py` | PASS | Random and chronological split helpers with seed 42. |
| `src/models.py` | PASS | Canonical model configurations are explicit. |
| `src/evaluation.py` | PASS WITH FOLLOW-UP | Centralises evaluation; exact environment and saved detailed outputs remain to be captured. |
| `src/msc_original.py` | PASS WITH FOLLOW-UP | Useful historical reconstruction, but it is not the exact tuned dissertation pipeline and should remain labelled as reconstruction. |
| `results/msc_original_results.csv` | PASS | Historical results are preserved in machine-readable form. |
| `results/canonical_research_metrics.csv` | PASS WITH FOLLOW-UP | Compact audited research metrics are now machine-readable; full experiment artifacts remain pending. |
| `results/` remaining research-extension outputs | MISSING | Detailed canonical CSV/figure artifacts from the broader research record are not currently committed. |
| `figures/msc_model_accuracy.svg` | PASS WITH FOLLOW-UP | Values are reconstructed from the dissertation; it should not be called an original dissertation figure. |
| `figures/msc_research_bridge.svg` | PASS | Useful visual bridge from MSc work to current research. |
| `data/raw/` | CORRECTLY EMPTY | Raw third-party data is not redistributed while licence/provenance remains unverified. |
| `requirements.txt` | PASS WITH FOLLOW-UP | Dependency ranges are documented, but exact installed versions are not yet frozen. |

## Priority fixes before supervisor outreach

### P0 — must complete

1. Verify the exact Kaggle dataset page/owner.
2. Verify redistribution licence/terms.
3. Record retrieval date.
4. Calculate and record SHA-256 for the exact local dataset used.
5. Capture exact Python and package versions.
6. Commit the authoritative research-extension CSV outputs and figures.
7. Make every canonical output traceable to an experiment ID, code version and dataset hash.

### P1 — should complete

1. Add a concise citation/acknowledgement section once dataset provenance is verified.
2. Add a final research-results summary page for supervisors.
3. Add detailed saved outputs for unseen-device, ablation, threshold and uncertainty analyses from the authoritative research record.

### P2 — polish

1. Improve the historical MSc figure scaling/visual polish.
2. Add an academic CV link when the shareable CV is ready.
3. Add ORCID only after the identifier is confirmed.
4. Add a public dissertation PDF only after preparing a shareable version.

## Supervisor-readiness rule

The repository should be considered **supervisor-ready as a research portfolio** once the P0 items are complete. It does not need to contain the raw third-party dataset or private academic records to be credible.

The goal is transparency: a supervisor should be able to understand what the MSc did, what the current research extension asks, what evidence has actually been generated, and exactly which limitations remain.
