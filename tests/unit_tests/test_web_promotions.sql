 -- depends_on: {{ ref('stg_web_page') }}, {{ ref('stg_promotion') }}

{% set options = {"use_database_models": false} %}

{% call dbt_unit_testing.test('web_promotions', 'promotions on webpage') %}

  {% call dbt_unit_testing.mock_ref ('stg_web_page', options) %}
    WP_WEB_PAGE_SK | WP_WEB_PAGE_ID     | WP_REC_START_DATE | WP_REC_END_DATE | WP_ACCESS_DATE_SK | WP_CREATION_DATE_SK | WP_AUTOGEN_FLAG | WP_CUSTOMER_SK | WP_URL              | WP_TYPE   | WP_CHAR_COUNT | WP_LINK_COUNT | WP_IMAGE_COUNT | WP_MAX_AD_COUNT
    5              | 'AAAAAAAAEAAAAAAA' |	'1999-09-04'    | '2001-09-02'    | 2,450,810	      | 2,452,620           |	'Y'           |	27,598,539    |	'http://www.foo.com'| 'welcome' |	2,531	    | 8	            | 3	             |  4
    3	           | 'AAAAAAAACAAAAAAA' |	'2000-09-03'	| null            | 2,450,810	      | 2,452,620           |	'Y'           |	27,598,539    |	'http://www.foo.com'| 'welcome' |	2,531	    | 8	            | 3	             |  4
  {% endcall %}

  {% call dbt_unit_testing.mock_ref ('stg_promotion', options) %}
    P_PROMO_SK | P_PROMO_ID         | P_START_DATE_SK| P_END_DATE_SK| P_ITEM_SK  |P_COST  | P_RESPONSE_TARGET |  P_PROMO_NAME | P_CHANNEL_EMAIL  | P_CHANNEL_CATALOG | P_CHANNEL_TV | P_CHANNEL_RADIO | P_CHANNEL_PRESS | P_CHANNEL_EVENT | P_CHANNEL_DEMO | P_CHANNEL_DETAILS | P_PURPOSE | P_DISCOUNT_ACTIVE
    1          | 'AAAAAAAAEAAAAAAA' | 2,450,164	     | 2,450,185	| 496,238    | 1,000  |	1	              | 'able'	      |  'N'	         | 'N'               | 'N'	      | 'N'	            | 'N'	          | 'N'               | 'N'              | null              | null      | null
    2          | 'AAAAAAAACAAAAAAA' | 2,450,164	     | 2,450,185	| 496,238    | 1,000  |	1	              | 'able'	      |  'N'	         | 'N'               | 'N'	      | 'N'	            | 'N'	          | 'N'               | 'N'              | null              | null      | null
  {% endcall %}

  {% call dbt_unit_testing.expect() %}
    WP_WEB_PAGE_SK | WP_WEB_PAGE_ID     | WP_REC_START_DATE | WP_REC_END_DATE
    5              | 'AAAAAAAAEAAAAAAA' |	'1999-09-04'    |	'2001-09-02'
  {% endcall %}
{% endcall %}
