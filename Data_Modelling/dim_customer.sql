USE DATABASE INS_DB;
USE SCHEMA INS_SC;
USE WAREHOUSE INS_WH;



-- create table

CREATE OR REPLACE TABLE DIM_CUSTOMER
(
CUSTOMER_ID VARCHAR NOT NULL PRIMARY KEY,
CUSTOMER_NAME VARCHAR NOT NULL,
DOB VARCHAR,
GENDER VARCHAR,
MARITAL_STATUS VARCHAR,
OCCUPATION VARCHAR,
CITY VARCHAR,
STATE VARCHAR,
REGION VARCHAR
);

-- CUSTOMER_ID is the Primary Key for Customer Dimension.
-- CUSTOMER_ID and CUSTOMER_NAME are mandatory fields.
-- This dimension stores customer-related information.

-- frd rule: A customer may hold multiple insurance policies.

---

-- Insert

INSERT INTO DIM_CUSTOMER
SELECT DISTINCT
CUSTOMER_ID,
CUSTOMER_NAME,
DOB,
GENDER,
MARITAL_STATUS,
OCCUPATION,
CITY,
STATE,
REGION
FROM INS_RAW;

-- DISTINCT is used to load only unique customer records.

=================================================================================

-- Validate

SELECT COUNT(*) FROM DIM_CUSTOMER;

SELECT * FROM DIM_CUSTOMER;








============================================================================================================================
DROP TABLE FACT_CLAIMS;
DROP TABLE FACT_PREMIUM;

DROP TABLE DIM_DATE;
DROP TABLE DIM_LOCATION;
DROP TABLE DIM_POLICY;
DROP TABLE DIM_AGENT;
DROP TABLE DIM_CUSTOMER;