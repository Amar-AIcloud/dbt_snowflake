-- this tests is same as singular test i.e all the amount_usd values should be greater than zero.
-- The model name and column_name are assigned in the schema.yml file

{% test greater_than_zero(model, column_name) %}

    select *
    from {{ model }}
    where {{ column_name }} < 0

{% endtest %}
