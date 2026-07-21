-- ============================================
-- Customer Churn Analysis
-- Author: Varshini A
-- ============================================

-- Step 1: Select Database
USE churn_analysis;

-- Step 2: Verify Table
SHOW TABLES;

-- Step 3: Check Table Structure
DESCRIBE telco_churn_cleaned;

-- Step 4: Preview Data
SELECT *
FROM telco_churn_cleaned
LIMIT 5;

-- Step 5: Total Customers
SELECT COUNT(*) AS total_customers
FROM telco_churn_cleaned;

-- Step 6: Overall Churn Distribution
SELECT
    Churn,
    COUNT(*) AS customers
FROM telco_churn_cleaned
GROUP BY Churn;

-- Step 7: Overall Churn Rate
SELECT
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate_percent
FROM telco_churn_cleaned;

-- ============================================
-- Step 8: Contract Type Analysis
-- Business Question:
-- Does contract type influence customer churn?
-- ============================================

SELECT
    Contract,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM telco_churn_cleaned
GROUP BY Contract
ORDER BY churn_rate DESC;

-- ============================================
-- Step 9: Internet Service Analysis
-- Business Question:
-- Does the type of internet service affect customer churn?
-- ============================================

SELECT
    InternetService,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM telco_churn_cleaned
GROUP BY InternetService
ORDER BY churn_rate DESC;

-- ============================================
-- Step 10: Payment Method Analysis
-- Business Question:
-- Does payment method influence customer churn?
-- ============================================

SELECT
    PaymentMethod,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM telco_churn_cleaned
GROUP BY PaymentMethod
ORDER BY churn_rate DESC;

-- ============================================
-- Step 11: Monthly Charges Analysis
-- Business Question:
-- Do higher monthly charges increase churn?
-- ============================================

SELECT
    Churn,
    ROUND(AVG(MonthlyCharges),2) AS avg_monthly_charges,
    ROUND(MIN(MonthlyCharges),2) AS minimum_charge,
    ROUND(MAX(MonthlyCharges),2) AS maximum_charge
FROM telco_churn_cleaned
GROUP BY Churn;

-- ============================================
-- Step 12: Tenure Analysis
-- Business Question:
-- Does customer tenure influence churn?
-- ============================================

SELECT
    Churn,
    ROUND(AVG(tenure),2) AS average_tenure_months
FROM telco_churn_cleaned
GROUP BY Churn;