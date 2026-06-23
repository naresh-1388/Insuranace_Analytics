USE DATABASE INS_DB;
USE SCHEMA INS_SC;
USE WAREHOUSE INS_WH;



-- create table

CREATE OR REPLACE TABLE FACT_PREMIUM
(
TRANSACTION_ID VARCHAR NOT NULL PRIMARY KEY,
TRANSACTION_DATE VARCHAR NOT NULL,
CUSTOMER_ID VARCHAR NOT NULL,
POLICY_NUMBER VARCHAR NOT NULL,
AGENT_ID VARCHAR NOT NULL,
PREMIUM_AMOUNT NUMBER(18,2) NOT NULL,
PAYMENT_METHOD VARCHAR,

FOREIGN KEY (CUSTOMER_ID) REFERENCES DIM_CUSTOMER(CUSTOMER_ID),
FOREIGN KEY (POLICY_NUMBER) REFERENCES DIM_POLICY(POLICY_NUMBER),
FOREIGN KEY (AGENT_ID) REFERENCES DIM_AGENT(AGENT_ID)
);

-- TRANSACTION_ID is the Primary Key for Premium Fact Table.
-- Foreign Keys are used to connect Customer, Policy and Agent Dimensions.
-- PREMIUM_AMOUNT is stored as NUMBER for calculations and reporting.
-- This table will be used for Premium Analysis and Operational Analysis reports.

-- frd rule: A customer may hold multiple insurance policies.
-- frd rule: Multiple policies may be managed by the same agent.
-- frd rule: Premium collections occur throughout the policy lifecycle.

---

-- Insert

INSERT INTO FACT_PREMIUM
SELECT
TRANSACTION_ID,
TRANSACTION_DATE,
CUSTOMER_ID,
POLICY_NUMBER,
AGENT_ID,
TRY_TO_NUMBER(PREMIUM_AMOUNT),
PAYMENT_METHOD
FROM INS_RAW;

-- TRY_TO_NUMBER converts premium amount into numeric format.

=================================================================================

-- Validate

SELECT COUNT(*) FROM FACT_PREMIUM;

SELECT * FROM FACT_PREMIUM;
