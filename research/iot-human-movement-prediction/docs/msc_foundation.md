# MSc Foundation and Research Continuity

## Original MSc project

**Degree:** MSc Advanced Computer Science, Birmingham City University, UK  
**Dissertation:** *Intelligent System to Predict Human Movement near IoT Devices*  
**Research area:** IoT analytics, environmental sensor data and machine learning

The original dissertation investigated whether environmental telemetry from IoT devices could be used to predict human movement. The dissertation covered the research background, literature review, methodology, data analysis, machine-learning implementation and discussion of limitations/future work.

## What is carried forward

The current repository preserves the central research problem and develops it into a more rigorous experimental programme:

| MSc foundation | Current research extension |
|---|---|
| Human movement prediction | Robust rare-event human-movement prediction |
| Environmental IoT telemetry | Environmental IoT sensing under distribution shift |
| Machine-learning models | Controlled model comparison |
| Prediction performance | Precision-recall and threshold-aware evaluation |
| Conventional evaluation | Random vs chronological evaluation |
| IoT devices | Unseen-device generalisation |
| Sensor variables | Feature-ablation analysis |

## Dataset audit

The research dataset contains **405,184 observations**, six environmental sensor features (`co`, `humidity`, `light`, `lpg`, `smoke`, `temp`) and a `motion` target. The audited dataset contains **482 positive movement events (~0.119%)**, three devices and approximately eight days of observations. The raw timestamp field is treated as Unix seconds. These values are recorded in the research portfolio and should be verified again whenever the working dataset changes.

## Important distinction

This repository contains a research extension of the MSc work. It should not imply that the later experiments were part of the original MSc dissertation. Results from the MSc and results produced during the current extension will be clearly separated.

## Original dissertation material

The full MSc dissertation is retained as supporting academic evidence in the user's private research records. Personal academic records and other documents that do not need to be public should not be uploaded to this public repository.

Where an original code file is suitable for publication, it will be reviewed, cleaned and added separately rather than copied into the repository without verification.

## Research continuity

The central continuity is:

**MSc question:** Can environmental IoT telemetry help predict human movement?  
**Research extension:** How reliable is that prediction when movement events are extremely rare and sensor distributions change across time and devices?

This distinction provides a clear bridge from the completed MSc project to a potential future MPhil/PhD research programme.
