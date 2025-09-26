{{ config(materialized='table', schema = 'staging') }}

Select
    P_PROMO_SK,
    P_PROMO_ID,
    P_START_DATE_SK,
    P_END_DATE_SK,
    P_ITEM_SK,
    P_COST,
    P_RESPONSE_TARGET,
    P_PROMO_NAME,
    P_CHANNEL_DMAIL,
    P_CHANNEL_EMAIL,
    P_CHANNEL_CATALOG,
    P_CHANNEL_TV,
    P_CHANNEL_RADIO,
    P_CHANNEL_PRESS,
    P_CHANNEL_EVENT,
    P_CHANNEL_DEMO,
    P_CHANNEL_DETAILS,
    P_PURPOSE,
    P_DISCOUNT_ACTIVE
From {{ source('TPCDS_SF100TCL', 'PROMOTION') }} limit 100
