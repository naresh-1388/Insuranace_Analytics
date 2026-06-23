USE DATABASE INS_DB;
USE SCHEMA INS_SC;
USE WAREHOUSE INS_WH;


-- create table

CREATE OR REPLACE TABLE DIM_POLICY
(
POLICY_NUMBER VARCHAR NOT NULL PRIMARY KEY,
POLICY_TYPE VARCHAR NOT NULL,
POLICY_STATUS VARCHAR,
COVERAGE_AMOUNT NUMBER(18,2)
);

-- POLICY_NUMBER is the Primary Key for Policy Dimension.
-- POLICY_NUMBER and POLICY_TYPE are mandatory fields.
-- This dimension stores policy-related information.

-- frd rule: A policy belongs to only one customer at a given point in time.
-- frd rule: A policy may generate zero, one, or multiple claims.
-- frd rule: Not every policy will have associated claim information.

---

-- Insert

INSERT INTO DIM_POLICY
SELECT DISTINCT
POLICY_NUMBER,
POLICY_TYPE,
POLICY_STATUS,
TRY_TO_NUMBER(COVERAGE_AMOUNT)
FROM INS_RAW;

-- DISTINCT is used to load only unique policy records.

=================================================================================

-- Validate

SELECT COUNT(*) FROM DIM_POLICY;

SELECT * FROM DIM_POLICY;
