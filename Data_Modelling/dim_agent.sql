USE DATABASE INS_DB;
USE SCHEMA INS_SC;
USE WAREHOUSE INS_WH;


-- create table

CREATE OR REPLACE TABLE DIM_AGENT
(
AGENT_ID VARCHAR NOT NULL PRIMARY KEY,
AGENT_NAME VARCHAR NOT NULL,
AGENT_BRANCH VARCHAR,
AGENT_EXPERIENCE_YEARS NUMBER
);

-- AGENT_ID is the Primary Key for Agent Dimension.
-- AGENT_ID and AGENT_NAME are mandatory fields.
-- This dimension stores agent-related information.

-- frd rule: Multiple policies may be managed by the same agent.
-- frd rule: Agents may transfer between branches during their employment.

---

-- Insert

INSERT INTO DIM_AGENT
SELECT DISTINCT
AGENT_ID,
AGENT_NAME,
AGENT_BRANCH,
TRY_TO_NUMBER(AGENT_EXPERIENCE_YEARS)
FROM INS_RAW;

-- DISTINCT is used to load only unique agent records.

=================================================================================

-- Validate

SELECT COUNT(*) FROM DIM_AGENT;

SELECT * FROM DIM_AGENT;
