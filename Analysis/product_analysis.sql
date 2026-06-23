USE DATABASE INS_DB;
USE SCHEMA INS_SC;
USE WAREHOUSE INS_WH;

-----=============================

there are 3 analysis as Per FRD

Product-wise business performance
Coverage analysis
Product adoption trends

===================================================

-- Product-wise Business Performance

SELECT
P.POLICY_TYPE,
COUNT(F.TRANSACTION_ID) AS TOTAL_POLICIES,
SUM(F.PREMIUM_AMOUNT) AS TOTAL_PREMIUM
FROM FACT_PREMIUM F
JOIN DIM_POLICY P
ON F.POLICY_NUMBER = P.POLICY_NUMBER
GROUP BY P.POLICY_TYPE
ORDER BY TOTAL_PREMIUM DESC;

-- Auto: Highest Premium Revenue
-- Home : Second Highest Premium Revenue
-- Health: Third Highest Premium Revenue
-- This report helps management understand which insurance products contribute the most to business revenue.

===================================================

-- Coverage Analysis

SELECT
POLICY_TYPE,
AVG(COVERAGE_AMOUNT) AS AVG_COVERAGE,
MIN(COVERAGE_AMOUNT) AS MIN_COVERAGE,
MAX(COVERAGE_AMOUNT) AS MAX_COVERAGE
FROM DIM_POLICY
GROUP BY POLICY_TYPE
ORDER BY AVG_COVERAGE DESC;

-- Home Policies : Highest Average Coverage
-- Health Policies: Medium Coverage
-- Auto Policies: Lower Coverage
-- This report helps management evaluate product coverage
-- distribution and understand customer protection levels.

===================================================

-- Product Adoption Trends

SELECT
POLICY_TYPE,
COUNT(POLICY_NUMBER) AS TOTAL_POLICIES
FROM DIM_POLICY
GROUP BY POLICY_TYPE
ORDER BY TOTAL_POLICIES DESC;

-- Auto: Most Adopted Product
-- Health: Second Most Adopted Product
-- Home:Third Most Adopted Product
-- This report helps management understand customer product preferences and measure product adoption trends.

===================================================

-- Product Summary

SELECT
COUNT(*) AS TOTAL_PRODUCTS,
SUM(COVERAGE_AMOUNT) AS TOTAL_COVERAGE,
AVG(COVERAGE_AMOUNT) AS AVG_COVERAGE
FROM DIM_POLICY;

-- This summary provides an overview of product coverage, product count and average coverage across all policy types.
