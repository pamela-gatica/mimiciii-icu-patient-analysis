-- =====================================================================================
-- Project: MIMIC-III ICU Patient Analysis
-- Author: Pamela Gatica
-- Description:
-- This query retrieves all records from the patients table in the MIMIC-III
-- Clinical Database. It provides a full overview of patient-level attributes
-- such as gender, date of birth, and mortality indicators.
-- =====================================================================================

-- Retrieve all patient records
SELECT *
FROM `physionet-data.mimiciii_clinical.patients`