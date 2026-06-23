USE DATABASE INS_DB;
USE SCHEMA INS_SC;
USE WAREHOUSE INS_WH;

---

there are 3 analysis as Per FRD

Agent performance comparison
Branch performance analysis
Payment method utilization

===================================================

-- Agent Performance Comparison

SELECT
A.AGENT_NAME,
COUNT(F.TRANSACTION_ID) AS TOTAL_POLICIES,
SUM(F.PREMIUM_AMOUNT) AS TOTAL_PREMIUM
FROM FACT_PREMIUM F
JOIN DIM_AGENT A
ON F.AGENT_ID = A.AGENT_ID
GROUP BY A.AGENT_NAME
ORDER BY TOTAL_PREMIUM DESC;

-- Pooja Mehta : Highest Premium Collection 57000.00
-- Rakesh Singh : Second Highest Premium Collection
-- This report helps management compare agent performance
-- based on policy count and premium collections.

===================================================

-- Branch Performance Analysis

SELECT
A.AGENT_BRANCH,
COUNT(F.TRANSACTION_ID) AS TOTAL_POLICIES,
SUM(F.PREMIUM_AMOUNT) AS TOTAL_PREMIUM
FROM FACT_PREMIUM F
JOIN DIM_AGENT A
ON F.AGENT_ID = A.AGENT_ID
GROUP BY A.AGENT_BRANCH
ORDER BY TOTAL_PREMIUM DESC;

-- Chennai  : Highest Premium Collection
-- Hyderaba : Second Highest Premium Collection
-- This report helps management identify top-performing
-- branches and improve business strategies.

===================================================

-- Payment Method Utilization

SELECT
PAYMENT_METHOD,
COUNT(TRANSACTION_ID) AS TOTAL_TRANSACTIONS,
SUM(PREMIUM_AMOUNT) AS TOTAL_PREMIUM
FROM FACT_PREMIUM
GROUP BY PAYMENT_METHOD
ORDER BY TOTAL_TRANSACTIONS DESC;

-- Credit Card:Most Used Payment Method
-- UPI : Second Most Used Payment Method
-- This report helps management understand customer
-- payment preferences and optimize payment channels.

===================================================

-- Operational Summary

SELECT
COUNT(DISTINCT AGENT_ID) AS TOTAL_AGENTS,
COUNT(DISTINCT PAYMENT_METHOD) AS TOTAL_PAYMENT_METHODS,
SUM(PREMIUM_AMOUNT) AS TOTAL_PREMIUM_COLLECTION
FROM FACT_PREMIUM;

-- This summary provides an overview of agent participation, payment method adoption and total premium collection.
