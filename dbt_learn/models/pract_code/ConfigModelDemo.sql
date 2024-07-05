{{ config( materialized = 'view') }}
select seq4() as deptid 
from table(generator(ROWCOUNT=>10))