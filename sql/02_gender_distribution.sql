-- =====================================================================================
-- Project: MIMIC-III ICU Patient Analysis
-- Author: Pamela Gatica
-- Description:
-- This query calculates the distribution with percentages of ICU patients by gender.
-- It helps identify demographic patterns within the dataset.
-- =====================================================================================

-- Count total patients by gender and percentages
SELECT 
    gender,
    COUNT(*) AS patient_count,
    ROUND(100 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM `physionet-data.mimiciii_clinical.patients`
GROUP BY gender
ORDER BY patient_count DESC;