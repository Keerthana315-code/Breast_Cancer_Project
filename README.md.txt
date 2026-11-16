# Breast Cancer Classification Using Machine Learning in R

## 1. Project Overview

Breast cancer is one of the major health challenges worldwide. Early identification and classification of breast tumours can support medical professionals in making informed decisions.

This project explores the use of machine learning techniques in R to classify breast cancer tumours as **Benign** or **Malignant** using numerical characteristics of cell nuclei.

The project uses the Breast Cancer Wisconsin (Diagnostic) dataset and performs data cleaning, exploratory data analysis (EDA), and machine learning classification.

## 2. Research Question

Can machine learning techniques classify breast cancer tumours as Benign or Malignant based on cell characteristics?

## 3. Objectives

- Obtain and understand a public breast cancer dataset.
- Clean and prepare the dataset using R.
- Explore the characteristics of Benign and Malignant tumour samples.
- Create meaningful visualizations.
- Develop a machine learning classification model.
- Evaluate and interpret the model's performance.

## 4. Dataset Description

**Dataset:** Breast Cancer Wisconsin (Diagnostic)

**Source:** UCI Machine Learning Repository

**Dataset URL:** https://archive.ics.uci.edu/ml/machine-learning-databases/breast-cancer-wisconsin/wdbc.data

The dataset contains 569 samples and 30 numerical features. The target variable is diagnosis, which has two classes:

- Benign (B)
- Malignant (M)

The features describe characteristics of cell nuclei, including radius, texture, perimeter, area, smoothness, compactness, concavity and symmetry.

## 5. Tools and Technologies

- R Programming Language
- RStudio
- Git and GitHub
- Base R for data processing and visualization

## 6. Project Structure

```text
BreastCancer_Project/
│
├── code/
│   ├── 01_data_import.R
│   ├── 02_download_dataset.R
│   ├── 03_data_import.R
│   ├── 04_data_cleaning.R
│   ├── 05_exploratory_analysis.R
│   └── 06_eda_summary.R
│
├── data/
│   ├── wdbc.data
│   └── breast_cancer_clean.csv
│
├── results/
│   ├── figures/
│   └── eda_group_summary.csv
│
├── report/
│
├── BreastCancer_Project.Rproj
└── README.md
```

## 7. Data Analysis Workflow

### Data Import and Cleaning

The original dataset was downloaded from the UCI repository and imported into R. Column names were assigned, the ID column was removed, and the diagnosis variable was converted into a factor with Benign and Malignant labels.

Missing values and duplicate records were checked.

### Exploratory Data Analysis

EDA was performed to understand the dataset and compare tumour characteristics.

The visualizations include:

- Diagnosis distribution bar chart.
- Mean radius histogram.
- Mean radius boxplot grouped by diagnosis.

Group-wise mean values were also calculated for selected features.

### Machine Learning Classification

A machine learning classification model will be developed to predict whether a tumour is Benign or Malignant.

The model development, testing and evaluation results will be documented here after completion.

## 8. How to Run the Project

1. Install R and RStudio.
2. Clone or download this GitHub repository.
3. Open `BreastCancer_Project.Rproj` in RStudio.
4. Run the R scripts inside the `code/` folder in numerical order.
5. Check the generated figures and analysis results inside the `results/` folder.

The dataset can also be downloaded using `code/02_download_dataset.R`.

## 9. Current Progress

- [x] Dataset downloaded.
- [x] Data imported.
- [x] Data cleaned.
- [x] Exploratory data analysis completed.
- [x] EDA summary generated.
- [ ] Machine learning model development.
- [ ] Model evaluation.
- [ ] Final report and interpretation.

## 10. Limitations

This project uses a public diagnostic dataset for educational and research purposes. The classification results should not be considered a substitute for professional medical diagnosis.

## 11. Author

**Keerthana Rasaiah**

BSc (Hons) Information Technology  
University of Vavuniya, Sri Lanka

## 12. License

This project is intended for academic and educational purposes.