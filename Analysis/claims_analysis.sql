USE DATABASE INS_DB;
USE SCHEMA INS_SC;
USE WAREHOUSE INS_WH;

----~~~~~~~~~~~~~~~~~~~~~~~~~

there are 4 analysis as Per FRD

Claim trends over time
Claim amounts by insurance category
Claim distribution across regions
Claim approval statistics

===================================================

-- Claim Trends Over Time

SELECT
TRANSACTION_DATE,
COUNT(CLAIM_NUMBER) AS TOTAL_CLAIMS,
SUM(CLAIM_AMOUNT) AS TOTAL_CLAIM_AMOUNT
FROM FACT_CLAIMS
GROUP BY TRANSACTION_DATE
ORDER BY TRANSACTION_DATE;

-- This report helps management understand claim patterns over timee and identify periods with high claim activity.
-- 4 claims
===================================================

-- Claim Amounts By Insurance Category

SELECT
P.POLICY_TYPE,
SUM(F.CLAIM_AMOUNT) AS TOTAL_CLAIM_AMOUNT
FROM FACT_CLAIMS F
JOIN DIM_POLICY P
ON F.POLICY_NUMBER = P.POLICY_NUMBER
GROUP BY P.POLICY_TYPE
ORDER BY TOTAL_CLAIM_AMOUNT DESC;

-- Home : 40000.00
-- Health : 24000.00
-- Auto  : 8000.00
-- This report helps management identify which insurance products generate the highest claim expenses.

===================================================

-- Claim Distribution Across Regions

SELECT
L.REGION,
COUNT(F.CLAIM_NUMBER) AS TOTAL_CLAIMS,
SUM(F.CLAIM_AMOUNT) AS TOTAL_CLAIM_AMOUNT
FROM FACT_CLAIMS F
JOIN DIM_CUSTOMER C
ON F.CUSTOMER_ID = C.CUSTOMER_ID
JOIN DIM_LOCATION L
ON C.CITY = L.CITY
AND C.STATE = L.STATE
GROUP BY L.REGION
ORDER BY TOTAL_CLAIM_AMOUNT DESC;

-- South : Highest Claim Volume 24000.00
-- West  : Lower Claim Volume 12000.00
-- This report helps management understand claim concentration across different business regions.

===================================================

-- Claim Approval Statistics

SELECT
CLAIM_STATUS,
COUNT(CLAIM_NUMBER) AS TOTAL_CLAIMS
FROM FACT_CLAIMS
GROUP BY CLAIM_STATUS
ORDER BY TOTAL_CLAIMS DESC;

-- Approved : 4

-- This report helps management evaluate claim processing efficiency
-- and claim approval performance.

===================================================

-- Overall Claims Summary

SELECT
COUNT(*) AS TOTAL_CLAIMS,
SUM(CLAIM_AMOUNT) AS TOTAL_CLAIM_AMOUNT,
AVG(CLAIM_AMOUNT) AS AVG_CLAIM_AMOUNT,
MIN(CLAIM_AMOUNT) AS MIN_CLAIM_AMOUNT,
MAX(CLAIM_AMOUNT) AS MAX_CLAIM_AMOUNT
FROM FACT_CLAIMS;

-- This summary provides an overall view of claims, including total claims, claim amount distribution,average claim value and claim exposure.



