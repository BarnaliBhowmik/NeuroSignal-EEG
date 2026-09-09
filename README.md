# NeuroSignal-EEG

## Subject-Independent EEG Classification Using Signal Processing and 1D Deep Learning

An end-to-end biomedical signal processing and deep learning project for classifying EEG recordings associated with rest and mental arithmetic tasks.

---

## Problem Statement

EEG signals contain temporal and frequency-domain information related to brain activity. However, extracting useful physiological information from multichannel EEG recordings is challenging because of noise, high dimensionality, inter-subject variability, and the risk of subject-level data leakage.

This project investigates whether EEG physiological information can be extracted through signal processing and deep learning for automated neural-state classification.

---

## Objectives

- Process multichannel EEG recordings using signal processing techniques.
- Analyze EEG signals in both time and frequency domains.
- Extract frequency-domain physiological features using Welch Power Spectral Density (PSD).
- Establish classical machine learning baselines using SVM and Random Forest.
- Develop a 1D CNN for automated EEG classification.
- Evaluate models using subject-independent train/test splitting.
- Aggregate epoch-level predictions to obtain recording-level predictions.
- Investigate the applicability of physiological signal processing and deep learning to biomedical monitoring systems.

---

## Dataset

**Dataset:** EEG During Mental Arithmetic Tasks  
**Source:** PhysioNet

The dataset contains EEG recordings from 36 subjects performing:

- Rest/background condition
- Mental arithmetic task

The original recordings were sampled at 500 Hz.

### Preprocessing

For this project:

- 19 scalp EEG channels were retained.
- ECG and reference-related channels were excluded.
- The first 60 seconds of every recording were used.
- Signals were band-pass filtered from 1–40 Hz.
- Signals were downsampled from 500 Hz to 250 Hz.
- Each recording was divided into 5-second epochs.

### Final Dataset

| Property | Value |
|---|---:|
| Subjects | 36 |
| Recordings | 72 |
| Epochs per recording | 12 |
| Total epochs | 864 |
| Rest epochs | 432 |
| Mental arithmetic epochs | 432 |
| Epoch shape | 19 × 1250 |

The dataset itself is **not included in this repository**.

---

## Methodology

### 1. Signal Preprocessing

The EEG processing pipeline consists of:

```text
Raw EEG
   ↓
Select scalp EEG channels
   ↓
First 60 seconds
   ↓
1–40 Hz band-pass filtering
   ↓
Downsampling: 500 → 250 Hz
   ↓
5-second epoching
   ↓
19 × 1250 EEG epochs

### Limitations
The dataset contains a relatively small number of subjects.
Only the first 60 seconds of each recording were used.
The current model performs binary classification rather than continuous physiological estimation.
No multimodal physiological sensor fusion was implemented.
Real-time or embedded deployment was not evaluated.
The project does not directly measure or estimate ICP.

### Future Work

Potential extensions include:

Multimodal physiological signal fusion
Temporal attention mechanisms
Transformer-based time-series models
Real-time inference
Lightweight models for wearable devices
Artifact-aware preprocessing
Continuous physiological parameter estimation
Integration with wearable biomedical sensors

### Dataset Reference

PhysioNet — EEG During Mental Arithmetic Tasks

https://physionet.org/content/eegmat/1.0.0/