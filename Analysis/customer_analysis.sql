USE DATABASE INS_DB;
USE SCHEMA INS_SC;
USE WAREHOUSE INS_WH;

---

there are 3 analysis as Per FRD

Customer distribution across locations
Customer segmentation by demographic attributes
Customer distribution by occupation

===================================================

-- Customer Distribution Across Locations

SELECT
STATE,
COUNT(CUSTOMER_ID) AS TOTAL_CUSTOMERS
FROM DIM_CUSTOMER
GROUP BY STATE
ORDER BY TOTAL_CUSTOMERS DESC;

-- Karnataka : 2
-- Maharashtra: 2
-- Telangana  : 2
-- Tamil Nadu : 1
-- Kerala : 1
-- This report helps management understand customer concentration across different states and identify high customer base locations.

===================================================

-- Customer Segmentation By Gender

SELECT
GENDER,
COUNT(CUSTOMER_ID) AS TOTAL_CUSTOMERS
FROM DIM_CUSTOMER
GROUP BY GENDER
ORDER BY TOTAL_CUSTOMERS DESC;

-- M:4
-- F:4
-- This report helps management understand customer demographics and supports targeted marketing and business strategies.

===================================================

-- Customer Distribution By Occupation

SELECT
OCCUPATION,
COUNT(CUSTOMER_ID) AS TOTAL_CUSTOMERS
FROM DIM_CUSTOMER
GROUP BY OCCUPATION
ORDER BY TOTAL_CUSTOMERS DESC;

-- Software Engineer : 1
-- Doctor         : 1
-- Business Owner  : 1
-- Teacher   : 1
-- Contractor : 1
-- Architect    : 1
-- Manager   : 1
-- Banker  : 1
-- This report helps management understand which occupations
-- contribute most to the customer base.

===================================================

-- Customer Distribution By Region

SELECT
REGION,
COUNT(CUSTOMER_ID) AS TOTAL_CUSTOMERS
FROM DIM_CUSTOMER
GROUP BY REGION
ORDER BY TOTAL_CUSTOMERS DESC;

-- South: 5
-- West: 3
-- Additional analysis to understand regional customer spread.


