{{ config(materialized='table', schema = 'staging') }}

select
    CC_CALL_CENTER_SK,
    CC_CALL_CENTER_ID,
    CC_REC_START_DATE,
    CC_REC_END_DATE,
    CC_CLOSED_DATE_SK,
    CC_OPEN_DATE_SK,
    CC_NAME,
    CC_CLASS,
    CC_EMPLOYEES,
    CC_SQ_FT,
    CC_HOURS,
    CC_MANAGER,
    CC_DIVISION,
    CC_DIVISION_NAME,
    CC_COMPANY,
    CC_COMPANY_NAME,
    CC_CITY,
    CC_COUNTY,
    CC_STATE,
    CC_ZIP,
    CC_COUNTRY,
    CC_TAX_PERCENTAGE
from {{ source('TPCDS_SF100TCL', 'CALL_CENTER') }}
