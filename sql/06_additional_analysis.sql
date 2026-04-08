-- =====================================================================================
-- Project: MIMIC-III ICU Patient Analysis
-- Author: Pamela Gatica
-- Description:
-- Extended analysis beyond the original lab exercise.
-- Includes mortality rate by gender, mortality rate by age group,
-- and average ICU length of stay by age group.
-- These queries were added to deepen the exploratory analysis and
-- strengthen the portfolio presentation of this project.
-- =====================================================================================

-- 6a. Mortality rate by gender
SELECT
    gender,
    COUNT(*) AS total_patients,
    SUM(expire_flag) AS deaths,
    ROUND(100 * SUM(expire_flag) / COUNT(*), 2) AS mortality_rate_pct
FROM `physionet-data.mimiciii_clinical.patients`
GROUP BY gender
ORDER BY gender;

-- -----------------------------------------------------------------------

-- 6b. Mortality rate by age group
WITH age_classified AS (
    SELECT
        p.subject_id,
        p.expire_flag,
        DATETIME_DIFF(MIN(a.admittime), p.dob, YEAR) AS first_admit_age
    FROM `physionet-data.mimiciii_clinical.patients` p
    INNER JOIN `physionet-data.mimiciii_clinical.admissions` a
        ON p.subject_id = a.subject_id
    GROUP BY p.subject_id, p.expire_flag, p.dob
)
SELECT
    CASE
        WHEN first_admit_age > 89  THEN '>89'
        WHEN first_admit_age >= 14 THEN 'adult'
        WHEN first_admit_age <= 1  THEN 'neonate'
        ELSE 'middle'
    END AS age_group,
    COUNT(*) AS total_patients,
    SUM(expire_flag) AS deaths,
    ROUND(100 * SUM(expire_flag) / COUNT(*), 2) AS mortality_rate_pct
FROM age_classified
GROUP BY age_group
ORDER BY age_group;

-- -----------------------------------------------------------------------

-- 6c. Average ICU length of stay by age group (in days)
SELECT
    CASE
        WHEN DATETIME_DIFF(ie.intime, pat.dob, YEAR) > 89  THEN '>89'
        WHEN DATETIME_DIFF(ie.intime, pat.dob, YEAR) >= 14 THEN 'adult'
        WHEN DATETIME_DIFF(ie.intime, pat.dob, YEAR) <= 1  THEN 'neonate'
        ELSE 'middle'
    END AS age_group,
    COUNT(*) AS total_stays,
    ROUND(AVG(DATETIME_DIFF(ie.outtime, ie.intime, HOUR) / 24.0), 2) AS avg_los_days
FROM `physionet-data.mimiciii_clinical.icustays` ie
INNER JOIN `physionet-data.mimiciii_clinical.patients` pat
    ON ie.subject_id = pat.subject_id
GROUP BY age_group
ORDER BY age_group;