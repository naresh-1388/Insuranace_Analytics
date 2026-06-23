USE DATABASE INS_DB;
USE SCHEMA INS_SC;
USE WAREHOUSE INS_WH;


-- create table

CREATE OR REPLACE TABLE DIM_LOCATION
(
CITY VARCHAR NOT NULL,
STATE VARCHAR NOT NULL,
REGION VARCHAR NOT NULL
);

-- CITY, STATE and REGION are mandatory fields.
-- This dimension stores location-related information.
-- This dimension will be used in Customer Analysis, Premium Analysis and Claims Analysis reports.

-- frd rule: Customers may relocate from one city or state to another.


-- Insert

INSERT INTO DIM_LOCATION
SELECT DISTINCT
CITY,
STATE,
REGION
FROM INS_RAW;

-- DISTINCT is used to load only unique location records.

=================================================================================

-- Validate

SELECT COUNT(*) FROM DIM_LOCATION;

SELECT * FROM DIM_LOCATION;
