
  create or replace   view DBT_PROJECT.DEV.sample1
  
   as (
    -- replace the column names and table_name

select column1, column2, column3, 
    (amount / 100)::numeric(16, 2)
 as amount_usd
from <table_name>
  );

