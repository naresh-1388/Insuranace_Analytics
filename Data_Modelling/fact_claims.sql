USE DATABASE INS_DB;
USE SCHEMA INS_SC;
USE WAREHOUSE INS_WH;


-- create table

CREATE OR REPLACE TABLE FACT_CLAIMS
(
CLAIM_NUMBER VARCHAR NOT NULL PRIMARY KEY,
POLICY_NUMBER VARCHAR NOT NULL,
CUSTOMER_ID VARCHAR NOT NULL,
CLAIM_TYPE VARCHAR,
CLAIM_STATUS VARCHAR,
CLAIM_AMOUNT NUMBER(18,2),
TRANSACTION_DATE VARCHAR,

FOREIGN KEY (CUSTOMER_ID) REFERENCES DIM_CUSTOMER(CUSTOMER_ID),
FOREIGN KEY (POLICY_NUMBER) REFERENCES DIM_POLICY(POLICY_NUMBER)
);

-- CLAIM_NUMBER is the Primary Key for Claims Fact Table.
-- Foreign Keys are used to connect Customer and Policy Dimensions.
-- CLAIM_AMOUNT is stored as NUMBER for calculations and reporting.
-- This table will be used for Claims Analysis reports.

-- frd rule: A policy may generate zero, one, or multiple claims.
-- frd rule: Not every policy will have associated claim information.

--------------------------------------------------------------------------------------------------------------------

-- Insert

INSERT INTO FACT_CLAIMS
SELECT
CLAIM_NUMBER,
POLICY_NUMBER,
CUSTOMER_ID,
CLAIM_TYPE,
CLAIM_STATUS,
TRY_TO_NUMBER(CLAIM_AMOUNT),
TRANSACTION_DATE
FROM INS_RAW
WHERE CLAIM_NUMBER IS NOT NULL;

-- Records without claims are excluded.
-- TRY_TO_NUMBER converts claim amount into numeric format.

=================================================================================

-- Validate

SELECT COUNT(*) FROM FACT_CLAIMS;

SELECT * FROM FACT_CLAIMS;
