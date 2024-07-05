{{ config(schema ='retail',
            materialized='ephemeral')
}}
select n.n_name country, 
count(c.c_mktsegment) total_mktsgment
from 
{{source("src_retail_schema","tb_cust")}} c
join
{{source("src_retail_schema","tb_nation")}} n
on c.c_nationkey = n.n_nationkey
group by n.n_name
