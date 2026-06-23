USE DATABASE INS_DB;
USE SCHEMA INS_SC;
USE WAREHOUSE INS_WH;



-----------------------------------------------------------------------------

there are 4 analysis as Per FRD

Premium collections over time
Premium collections by region
Premium collections by product category
Premium collections by agent


===================================================

-- Premium Collections Over Time

SELECT
TRANSACTION_DATE,
SUM(PREMIUM_AMOUNT) AS TOTAL_PREMIUM
FROM FACT_PREMIUM
GROUP BY TRANSACTION_DATE
ORDER BY TRANSACTION_DATE;




SELECT
TRANSACTION_DATE,
SUM(PREMIUM_AMOUNT) over (ORDER BY TRANSACTION_DATE)AS Transaction_date
FROM FACT_PREMIUM;

-- Max -- 35000.00 and Min 12000.00
-- This report helps to understand how premium collections are changing over time and identify growth or decline trends.

===============================================
---

-- Premium Collections By Region

SELECT
L.REGION,
SUM(F.PREMIUM_AMOUNT) AS TOTAL_PREMIUM
FROM FACT_PREMIUM F
JOIN DIM_CUSTOMER C
ON F.CUSTOMER_ID = C.CUSTOMER_ID
JOIN DIM_LOCATION L
ON C.CITY = L.CITY
AND C.STATE = L.STATE
GROUP BY L.REGION
ORDER BY TOTAL_PREMIUM DESC;


----- -- South --> 140000.00 and West -->> 45000.00
-- This report shows which regions generate the highest premium revenue
-- and helps mngmnt focus on high-performing market


=====================================================

-------

-- Premium Collections By Product Category

SELECT
P.POLICY_TYPE,
SUM(F.PREMIUM_AMOUNT) AS TOTAL_PREMIUM
FROM FACT_PREMIUM F
JOIN DIM_POLICY P
ON F.POLICY_NUMBER = P.POLICY_NUMBER
GROUP BY P.POLICY_TYPE
ORDER BY TOTAL_PREMIUM DESC;

--  Auto - 160000.00 
--  Home -- 114000.00
--- Health -- 96000.00
-- This report helps management understand which insurance products
-- generate the highest premium revenue and which products require
-- additional business focus or marketing efforts.


=====================================================

---

-- Premium Collections By Agent

SELECT
A.AGENT_NAME,
SUM(F.PREMIUM_AMOUNT) AS TOTAL_PREMIUM
FROM FACT_PREMIUM F
JOIN DIM_AGENT A
ON F.AGENT_ID = A.AGENT_ID
GROUP BY A.AGENT_NAME
ORDER BY TOTAL_PREMIUM DESC;

-- 
-- This report helps management evaluate agent performance based on
-- premium collections and identify top-performing and low-performing agents.

Pooja Mehta	57000.00
Rakesh Singh	46000.00
Kiran Rao	30000.00
Mahesh Verma	27000.00
Deepak Nair	25000.00
