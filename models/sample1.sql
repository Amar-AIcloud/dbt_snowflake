-- replace the column names and table_name

select column1, column2, column3, {{ cents_to_dollars('amount') }} as amount_usd
from <table_name>
