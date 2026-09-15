<div align="center">

<img src="figures/project-banner.svg" alt="Robust IoT Human Movement Prediction" width="100%" />

# Robust IoT Human Movement Prediction

**Environmental IoT • Machine Learning • Human Movement**

[Overview](#overview) • [MSc Foundation](#msc-foundation) • [Dataset](#dataset) • [Documentation](#documentation)

</div>

## Overview

This research project builds on my MSc dissertation, **Intelligent System to Predict Human Movement near IoT Devices**.

It uses environmental sensor data from IoT devices and machine-learning methods to study and predict human movement.

The repository brings together the original MSc work, later experimental analysis, results and documentation in one place.

## MSc Foundation

**MSc Advanced Computer Science — Distinction**  
Birmingham City University, UK

**Dissertation:** *Intelligent System to Predict Human Movement near IoT Devices*

The original MSc work focused on preparing environmental sensor data, exploring the data and comparing machine-learning models for human movement prediction.

## Current Research Direction

**Robust rare-event human movement prediction from environmental IoT sensors.**

The current work extends the MSc foundation by looking at prediction behaviour across time and sensing devices.

> The later research experiments are clearly separated from the original MSc work.

## Dataset

The project uses the **Environmental Sensor Telemetry Data** dataset published on Kaggle by **Gary A. Stafford**. The dataset is listed as **CC0: Public Domain**.

The working dataset contains **405,184 rows**, **9 columns** and data from **3 IoT devices**. The observation period is **12–19 July 2020 UTC**.

[Dataset source on Kaggle](https://www.kaggle.com/datasets/garystafford/environmental-sensor-data-132k)

The raw CSV is not stored in this repository.

## Project Structure

```text
research/iot-human-movement-prediction/
├── data/
├── docs/
├── figures/
├── notebooks/
├── results/
├── src/
└── requirements.txt
```

## Documentation

- [Project overview](docs/01_project_overview.md)
- [MSc background](docs/02_msc_background.md)
- [Dataset](docs/03_dataset.md)
- [Basic methodology](docs/04_methodology.md)
- [Dataset documentation](docs/dataset_documentation.md)
- [MSc results](docs/msc_results.md)
- [Experimental protocol](docs/experimental_protocol.md)
- [Reproducibility](docs/reproducibility.md)

## Code and Results

The repository contains Python notebooks, supporting source code and documented results. The MSc results and later research-extension experiments are kept as separate records so the history of the project remains clear.

## Citation

See [`CITATION.cff`](CITATION.cff) for citation information.

---

**Author:** Aman Gupta  
**Field:** AI • Data Science • IoT
