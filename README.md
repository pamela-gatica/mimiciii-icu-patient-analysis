# Exploratory ICU Patient Analysis using MIMIC-III and BigQuery

## Overview
This project presents an exploratory data analysis of ICU patient data using the MIMIC-III clinical database in Google BigQuery, transforming an academic lab exercise into a portfolio-ready healthcare analytics project.

## Objectives
- Explore patient demographic data
- Analyze gender distribution in ICU patients
- Evaluate mortality rates
- Study patient age groups and their distribution
- Analyze ICU stay details and pre-ICU timing
- Extend the original lab into a portfolio-level data project

## Tools Used
- Google BigQuery
- SQL
- MIMIC-III Dataset
- Microsoft Word / PDF
- (Optional) Python / Power BI for visualization

## Dataset
The MIMIC-III database is a large, publicly available dataset containing de-identified health data from ICU patients.
The analysis focuses on key tables including:
- patients
- admissions
- icustays

## Analysis Performed

### 1. Patient Data Exploration
Retrieved all patient records and key attributes such as gender, date of birth, and mortality indicators.

### 2. Gender Distribution
Analyzed the distribution of patients by gender.

### 3. Mortality Analysis
Evaluated the proportion of patients who survived vs. died during ICU stay.

### 4. Age Group Analysis
Grouped patients into age categories (neonate, middle, adult, >89) and analyzed distributions.

### 5. ICU Stay Details
Examined ICU stay records, patient age at admission, and pre-ICU time.

### 6. Additional Analysis (Extended Work)
- Mortality rate by gender
- Mortality rate by age group
- ICU stay patterns and potential risk indicators

## Sample Visualization
![Gender Distribution](images/gender_distribution.png)

## Key Findings
- The ICU population shows a slight male predominance (~56%), suggesting higher ICU utilization among males
- The mortality rate (~34%) indicates a high-risk critical care population
- Adult patients represent the largest proportion of ICU admissions
- Elderly patients (>89) show distinct patterns in gender distribution
- ICU stay characteristics and pre-ICU time may influence patient outcomes and severity

## Repository Structure
mimiciii-icu-patient-analysis/
│
├── README.md
├── sql/
│ ├── 01_patient_exploration.sql
│ ├── 02_gender_distribution.sql
│ ├── 03_mortality_analysis.sql
│ ├── 04_age_group_analysis.sql
│ ├── 05_icu_stay_details.sql
│ └── 06_additional_analysis.sql
│
├── images/
│ ├── gender_distribution.png
│ ├── mortality_chart.png
│ └── age_group_chart.png
│
└── docs/
└── project_report.pdf

## Limitations
- This analysis is exploratory and does not establish causality
- Age calculations may be affected by de-identification rules in MIMIC-III
- Results are based on available queried data only

## Future Improvements
- Add Power BI dashboard
- Perform predictive modeling for ICU outcomes
- Expand analysis to include diagnosis and treatment data

## How to Reproduce
1. Access Google BigQuery
2. Load the MIMIC-III dataset (physionet-data.mimiciii_clinical)
3. Run the SQL queries located in the `/sql` folder
4. Review the outputs and compare with the insights described in this project

## Author
Pamela Gatica
