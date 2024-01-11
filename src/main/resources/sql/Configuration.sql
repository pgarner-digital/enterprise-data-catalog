use role SYSADMIN;
create or replace database EDC;
--drop database EDC;

USE ROLE ACCOUNTADMIN;
CREATE OR REPLACE ROLE EDC_ANALYST;
GRANT ROLE EDC_ANALYST TO USER PatrickGarner;
GRANT USAGE ON WAREHOUSE COMPUTE_WH TO ROLE EDC_ANALYST;
GRANT USAGE ON DATABASE EDC TO ROLE EDC_ANALYST;
GRANT USAGE ON SCHEMA EDC.PUBLIC TO ROLE EDC_ANALYST;
GRANT CREATE TABLE ON SCHEMA EDC.PUBLIC TO ROLE EDC_ANALYST;
GRANT SELECT ON ALL TABLES IN SCHEMA EDC.PUBLIC TO ROLE EDC_ANALYST;
GRANT SELECT ON FUTURE TABLES IN SCHEMA EDC.PUBLIC TO ROLE EDC_ANALYST;
GRANT INSERT, UPDATE, DELETE ON ALL TABLES IN DATABASE EDC TO ROLE EDC_ANALYST;
GRANT TRUNCATE ON ALL TABLES IN SCHEMA EDC.PUBLIC TO ROLE EDC_ANALYST;
GRANT CREATE VIEW ON SCHEMA EDC.PUBLIC TO ROLE EDC_ANALYST;
GRANT CREATE PROCEDURE ON SCHEMA EDC.PUBLIC TO ROLE EDC_ANALYST;

use role EDC_ANALYST;
use database EDC;
use schema EDC.PUBLIC;
create or replace table ASSETS(
    orgid text,
    name text,
    externalid text,
    data_type text,
    data_type_length text,
    is_nullable text,
    position text,
    is_primary_key text,
    description text,
    business_summary text,
    contact_email text,
    program_office text,
    restricted_to_public text,
    sensitive_data text,
    data_owner text,
    data_steward text,
    technical_steward text
);

create or replace view ASSETS_SUMMARY as (
    select
        orgid,
        name,
        externalid,
        description,
        contact_email
    from ASSETS
);

select * from ASSETS_SUMMARY;