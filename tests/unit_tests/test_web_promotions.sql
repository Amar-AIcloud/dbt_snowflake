{% call dbt_unit_testing.test('web_promotions', 'promotions on webpage') %}

  {% call dbt_unit_testing.mock_ref ('stg_promotion', {"input_format": "csv", "column_separator": "|"}) %}
    P_PROMO_ID         |P_COST           | P_RESPONSE_TARGET |  P_PROMO_NAME| P_CHANNEL_EMAIL  | P_CHANNEL_CATALOG | P_CHANNEL_TV | P_CHANNEL_RADIO | P_CHANNEL_PRESS | P_CHANNEL_EVENT
    'AAAAAAAAEAAAAAAA' | 1,000           |	1	             | 'able'	    |  'N'	           | 'N'               | 'N'	      | 'N'	            | 'N'	          | 'N'
    'AAAAAAAAEAAAAAAA' | 1,000           |	1	             | 'able'	    |  'N'	           | 'N'               | 'N'	      | 'N'	            | 'N'	          | 'N'
  {% endcall %}

  {% call dbt_unit_testing.mock_ref ('stg_web_page', {"input_format": "csv", "column_separator": "|"}) %}
    WP_WEB_PAGE_SK | WP_WEB_PAGE_ID     | WP_REC_START_DATE | WP_REC_END_DATE
    5              | 'AAAAAAAAEAAAAAAA' |	'1999-09-04'      |	'2001-09-02'
    3	           | 'AAAAAAAACAAAAAAA' |	'2000-09-03'	  | null
  {% endcall %}


  {% call dbt_unit_testing.expect({"input_format": "csv", "column_separator": "|"}) %}
    WP_WEB_PAGE_SK | WP_WEB_PAGE_ID     | WP_REC_START_DATE | WP_REC_END_DATE | P_COST           | P_RESPONSE_TARGET |  P_PROMO_NAME| P_CHANNEL_EMAIL  | P_CHANNEL_CATALOG | P_CHANNEL_TV | P_CHANNEL_RADIO | P_CHANNEL_PRESS | P_CHANNEL_EVENT
    5              | 'AAAAAAAAEAAAAAAA' |	'1999-09-04'      |	'2001-09-02'  | 1,000           |	1	             | 'able'	    |  'N'	           | 'N'               | 'N'	      | 'N'	            | 'N'	          | 'N'
  {% endcall %}
{% endcall %}

{% endcall %}
