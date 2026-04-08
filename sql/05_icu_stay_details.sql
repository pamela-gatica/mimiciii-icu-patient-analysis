-- =====================================================================================
-- Project: MIMIC-III ICU Patient Analysis
-- Author: Pamela Gatica
-- Description:
-- This query combines data from three tables (icustays, patients, and admissions)
-- to provide a detailed view of each ICU visit. It calculates the patient's age
-- at admission, the pre-ICU time (days between hospital admission and ICU admission),
-- and assigns each patient to an age group (neonate, middle, adult, or >89).
-- =====================================================================================

-- Retrieve ICU stay details with age and pre-ICU time
SELECT
    ie.subject_id,
    ie.hadm_id,
    ie.icustay_id,
    ie.intime,
    ie.outtime,
    adm.admittime,
    DATETIME_DIFF(ie.intime, pat.dob, YEAR) AS age,
    DATETIME_DIFF(ie.intime, adm.admittime, DAY) AS preiculos,
    CASE
        WHEN DATETIME_DIFF(ie.intime, pat.dob, YEAR) > 89   THEN '>89'
        WHEN DATETIME_DIFF(ie.intime, pat.dob, YEAR) >= 14  THEN 'adult'
        WHEN DATETIME_DIFF(ie.intime, pat.dob, YEAR) <= 1   THEN 'neonate'
        ELSE 'middle'
    END AS ICUSTAY_AGE_GROUP
FROM `physionet-data.mimiciii_clinical.icustays` ie
INNER JOIN `physionet-data.mimiciii_clinical.patients` pat
    ON ie.subject_id = pat.subject_id
INNER JOIN `physionet-data.mimiciii_clinical.admissions` adm
    ON ie.hadm_id = adm.hadm_id
ORDER BY subject_id, icustay_id;