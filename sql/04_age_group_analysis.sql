-- =====================================================================================
-- Project: MIMIC-III ICU Patient Analysis
-- Author: Pamela Gatica
-- Description:
-- This query calculates each patient's gender and age at their first hospital
-- admission, then groups them into age categories: neonate, middle, adult, and >89.
-- Ages above 89 were replaced with 300 in MIMIC-III for de-identification purposes.
-- =====================================================================================

WITH first_admission_time AS (
    SELECT
        p.subject_id,
        p.dob,
        p.gender,
        MIN(a.admittime) AS first_admittime,
        DATETIME_DIFF(MIN(a.admittime), p.dob, YEAR) AS first_admit_age
    FROM `physionet-data.mimiciii_clinical.patients` p
    INNER JOIN `physionet-data.mimiciii_clinical.admissions` a
        ON p.subject_id = a.subject_id
    GROUP BY p.subject_id, p.dob, p.gender
),
age AS (
    SELECT
        subject_id, dob, gender,
        first_admittime, first_admit_age,
        CASE
            WHEN first_admit_age > 89 THEN '>89'
            WHEN first_admit_age >= 14 THEN 'adult'
            WHEN first_admit_age <= 1  THEN 'neonate'
            ELSE 'middle'
        END AS age_group
    FROM first_admission_time
)
-- Count patients by age group and gender
SELECT
    age_group,
    gender,
    COUNT(subject_id) AS NumberOfPatients
FROM age
GROUP BY age_group, gender
ORDER BY age_group, gender;