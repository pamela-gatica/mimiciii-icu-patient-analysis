-- =====================================================================================
-- Project: MIMIC-III ICU Patient Analysis
-- Author: Pamela Gatica
-- Description:
-- This query counts how many patients died (expire_flag = 1) versus survived
-- (expire_flag = 0) during their hospital stay. It provides a baseline view
-- of the mortality rate within the MIMIC-III ICU dataset.
-- =====================================================================================

-- Count patients by mortality status with percentages
SELECT
    expire_flag,
    COUNT(*) AS patient_count,
    ROUND(100 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM `physionet-data.mimiciii_clinical.patients`
GROUP BY expire_flag
ORDER BY expire_flag;