{{ config(materialized='table') }}

SELECT
    WP_WEB_PAGE_SK,
    WP_WEB_PAGE_ID,
    WP_REC_START_DATE,
    WP_REC_END_DATE,
    P_COST,
    P_RESPONSE_TARGET,
    P_PROMO_NAME,
    P_CHANNEL_EMAIL,
    P_CHANNEL_CATALOG,
    P_CHANNEL_TV,
    P_CHANNEL_RADIO,
    P_CHANNEL_PRESS,
    P_CHANNEL_EVENT
FROM {{ ref('stg_web_page')}} swp
join {{ ref('stg_promotion')}} sp
on swp.WP_WEB_PAGE_ID = sp.P_PROMO_ID
WHERE WP_REC_START_DATE > '1997-09-04'
