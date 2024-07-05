{% snapshot dim_employee_snapshot %}

{{ config ( target_database = 'dwh',
            target_schema = 'asis',
            unique_key = 'empno',
            strategy = 'timestamp' ,
            updated_at = 'last_modified_date' )
            
            }}
SELECT EMPNO,
ename,
salary,
phone,
last_modified_date
from 
{{ source("src_hr","tb_emp") }}

{% endsnapshot %}