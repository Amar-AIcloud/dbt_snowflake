-- The following test can be done when a table/view is created after dbt run
-- this tests specifies that all the amount_usd values should be greater than zero.

select amount_usd from sample1
where amount_usd < 0
