USE DATABASE INS_DB;
USE SCHEMA INS_SC;
USE WAREHOUSE INS_WH;


---- create table -------------

CREATE OR REPLACE TABLE DIM_DATE
(
TRANSACTION_DATE VARCHAR NOT NULL,
YEAR NUMBER,
MONTH NUMBER,
QUARTER NUMBER
);

-- TRANSACTION_DATE is the Primary Key for Date Dimension.
-- This dimension stores date-related information.
-- This dimension will be used in Premium Trend Analysis and Claim Trend Analysis.

-- frd rule: Premium collections occur throughout the policy lifecycle.

---

-- Insert

INSERT INTO DIM_DATE
SELECT DISTINCT
TRANSACTION_DATE,
YEAR(TO_DATE(TRANSACTION_DATE,'DD-MM-YY')) AS YEAR,
MONTH(TO_DATE(TRANSACTION_DATE,'DD-MM-YY')) AS MONTH,
QUARTER(TO_DATE(TRANSACTION_DATE,'DD-MM-YY')) AS QUARTER
FROM INS_RAW;

-- DISTINCT is used to load only unique transaction dates.

=================================================================================

-- Validate

SELECT COUNT(*) FROM DIM_DATE;

SELECT * FROM DIM_DATE;
