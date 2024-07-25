{{
config( materalized='table',
        transient=False,
        database='dwh',
        schema='asis'
)
}}

{#
log("comment",info=true)
#}
select empno,ename , salary, {{multiply( "salary" , 0.4 )}}
from {{source("src_hr","tb_emp")}}
